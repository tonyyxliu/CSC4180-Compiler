; ModuleID = './llvm_ir/test5.ll'
source_filename = "./llvm_ir/test5.ll"

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
declare i32 @scanf(i8* nocapture readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
  %A1 = alloca i32, align 4
  %_scanf_format_1 = alloca [3 x i8], align 1
  %.fca.0.gep9 = getelementptr inbounds [3 x i8], [3 x i8]* %_scanf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep9, align 1
  %.fca.1.gep10 = getelementptr inbounds [3 x i8], [3 x i8]* %_scanf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep10, align 1
  %.fca.2.gep11 = getelementptr inbounds [3 x i8], [3 x i8]* %_scanf_format_1, i64 0, i64 2
  store i8 0, i8* %.fca.2.gep11, align 1
  %1 = call i32 (i8*, ...) @scanf(i8* nonnull %.fca.0.gep9, i32* nonnull %A1)
  %_tmp_1 = load i32, i32* %A1, align 4
  %_printf_format_1 = alloca [4 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 2
  store i8 10, i8* %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 3
  store i8 0, i8* %.fca.3.gep, align 1
  %factor = mul i32 %_tmp_1, 10
  %_tmp_37 = add i32 %factor, 45
  %2 = call i32 (i8*, ...) @printf(i8* nonnull %.fca.0.gep, i32 %_tmp_37)
  ret i32 0
}

attributes #0 = { nofree nounwind }
