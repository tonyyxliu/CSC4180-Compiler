; ModuleID = './llvm_ir/test7.ll'
source_filename = "./llvm_ir/test7.ll"

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
declare i32 @scanf(i8* nocapture readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
  %A = alloca i32, align 4
  %B = alloca i32, align 4
  %C = alloca i32, align 4
  %_scanf_format_1 = alloca [9 x i8], align 1
  %.fca.0.gep1 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep1, align 1
  %.fca.1.gep2 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep2, align 1
  %.fca.2.gep3 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 2
  store i8 32, i8* %.fca.2.gep3, align 1
  %.fca.3.gep4 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 3
  store i8 37, i8* %.fca.3.gep4, align 1
  %.fca.4.gep = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 4
  store i8 100, i8* %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 5
  store i8 32, i8* %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 6
  store i8 37, i8* %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 7
  store i8 100, i8* %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 8
  store i8 0, i8* %.fca.8.gep, align 1
  %1 = call i32 (i8*, ...) @scanf(i8* nonnull %.fca.0.gep1, i32* nonnull %A, i32* nonnull %B, i32* nonnull %C)
  %_tmp_1 = load i32, i32* %A, align 4
  %_tmp_2 = load i32, i32* %C, align 4
  %_tmp_6 = load i32, i32* %B, align 4
  %_tmp_4 = add i32 %_tmp_1, 5
  %_tmp_5 = sub i32 %_tmp_4, %_tmp_2
  %_tmp_7 = add i32 %_tmp_5, %_tmp_6
  %_printf_format_1 = alloca [4 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 2
  store i8 10, i8* %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [4 x i8], [4 x i8]* %_printf_format_1, i64 0, i64 3
  store i8 0, i8* %.fca.3.gep, align 1
  %2 = call i32 (i8*, ...) @printf(i8* nonnull %.fca.0.gep, i32 %_tmp_7)
  ret i32 0
}

attributes #0 = { nofree nounwind }
