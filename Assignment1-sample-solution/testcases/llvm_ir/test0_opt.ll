; ModuleID = './llvm_ir/test0.ll'
source_filename = "./llvm_ir/test0.ll"

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
  %_printf_format_1 = alloca [4 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 2
  store i8 10, i8* %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 3
  store i8 0, i8* %.fca.3.gep, align 1
  %1 = call i32 (i8*, ...) @printf(i8* nonnull %.fca.0.gep, i32 30)
  ret i32 0
}

attributes #0 = { nofree nounwind }
