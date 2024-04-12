
import os

import llvmlite.binding as llvm
import llvmlite.ir as llvmir


def create_global_string(builder: llvmir.IRBuilder, s: str, name: str) -> llvmir.Instruction:
    type_i8_x_len = llvmir.types.ArrayType(llvmir.types.IntType(8), len(s))
    constant = llvmir.Constant(type_i8_x_len, bytearray(s.encode('utf-8')))
    variable = llvmir.GlobalVariable(builder.module, type_i8_x_len, name)
    variable.linkage = 'private'
    variable.global_constant = True
    variable.initializer = constant
    variable.align = 1

    zero = llvmir.Constant(llvmir.types.IntType(32), 0)
    variable_pointer = builder.gep(variable, [zero, zero])
    return variable_pointer


def main():
    # create IR
    
    # common types
    type_i8p = llvmir.types.PointerType(llvmir.types.IntType(8))
    type_i32 = llvmir.types.IntType(32)

    module_ir = llvmir.Module('hello_world')
    builder = llvmir.IRBuilder()

    # int printf(char* format, ...)
    params_printf = [type_i8p]
    type_func_printf = llvmir.types.FunctionType(type_i32, params_printf, var_arg=True)
    func_printf = llvmir.Function(module_ir, type_func_printf, 'printf')

    # int main()
    type_func_main = llvmir.types.FunctionType(type_i32, [])
    func_main = llvmir.Function(module_ir, type_func_main, 'main')

    # { printf("Hello, world\n"); return 0; }
    block_main = func_main.append_basic_block('entry')
    builder.position_at_end(block_main)
    string_hello = create_global_string(builder, 'Hello, world!\n\0', 's')
    builder.call(func_printf, [string_hello])
    zero = llvmir.Constant(type_i32, 0)
    builder.ret(zero)

    # init llvm
    llvm.initialize()
    llvm.initialize_native_target()
    llvm.initialize_native_asmprinter()

    target = llvm.Target.from_default_triple()
    target_machine = target.create_target_machine()

    print(module_ir)
    print()
    module = llvm.parse_assembly(str(module_ir))
    module.verify()
    obj = target_machine.emit_object(module)

    file = open('main.o', 'wb')
    file.write(obj)
    file.close()

    # print('Compiling...')
    # os.system('cc -o main main.o')
    # print('Executing...')
    # os.system('./main')


if __name__ == '__main__':
    main()