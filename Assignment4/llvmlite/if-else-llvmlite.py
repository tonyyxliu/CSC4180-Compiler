from llvmlite import ir, binding

# Initialize LLVM
binding.initialize()
binding.initialize_native_target()
binding.initialize_native_asmprinter()

# Create a new LLVM module
module = ir.Module(name="example_module")

# Create a new LLVM IR builder
builder = ir.IRBuilder()

# Create the main function
main_func = ir.Function(module, ir.FunctionType(ir.VoidType(), []), name="main")
main_block = main_func.append_basic_block(name="entry")
builder.position_at_end(main_block)

# Define the condition
condition = builder.icmp_signed('!=', ir.Constant(ir.IntType(32), 1), ir.Constant(ir.IntType(32), 0))

# Create blocks for if and else
if_block = main_func.append_basic_block(name="if_block")
else_block = main_func.append_basic_block(name="else_block")
merge_block = main_func.append_basic_block(name="merge_block")

# Branch based on the condition
builder.cbranch(condition, if_block, else_block)

# Generate code for the if block
builder.position_at_end(if_block)
if_value = ir.Constant(ir.IntType(32), 1)
builder.branch(merge_block)

# Generate code for the else block
builder.position_at_end(else_block)
else_value = ir.Constant(ir.IntType(32), 0)
builder.branch(merge_block)

# Merge block
builder.position_at_end(merge_block)
phi = builder.phi(ir.IntType(32))
phi.add_incoming(if_value, if_block)
phi.add_incoming(else_value, else_block)

builder.ret_void()

# Print the LLVM IR
print(module)
