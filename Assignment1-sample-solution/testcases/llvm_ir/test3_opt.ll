; ModuleID = './llvm_ir/test3.ll'
source_filename = "./llvm_ir/test3.ll"

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
declare i32 @scanf(i8* nocapture readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
  %A = alloca i32, align 4
  %C = alloca i32, align 4
  %_scanf_format_1 = alloca [6 x i8], align 1
  %.fca.0.gep1 = getelementptr inbounds [6 x i8], [6 x i8]* %_scanf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep1, align 1
  %.fca.1.gep2 = getelementptr inbounds [6 x i8], [6 x i8]* %_scanf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep2, align 1
  %.fca.2.gep3 = getelementptr inbounds [6 x i8], [6 x i8]* %_scanf_format_1, i64 0, i64 2
  store i8 32, i8* %.fca.2.gep3, align 1
  %.fca.3.gep4 = getelementptr inbounds [6 x i8], [6 x i8]* %_scanf_format_1, i64 0, i64 3
  store i8 37, i8* %.fca.3.gep4, align 1
  %.fca.4.gep5 = getelementptr inbounds [6 x i8], [6 x i8]* %_scanf_format_1, i64 0, i64 4
  store i8 100, i8* %.fca.4.gep5, align 1
  %.fca.5.gep6 = getelementptr inbounds [6 x i8], [6 x i8]* %_scanf_format_1, i64 0, i64 5
  store i8 0, i8* %.fca.5.gep6, align 1
  %1 = call i32 (i8*, ...) @scanf(i8* nonnull %.fca.0.gep1, i32* nonnull %A, i32* nonnull %C)
  %_tmp_1 = load i32, i32* %A, align 4
  %_tmp_2 = load i32, i32* %C, align 4
  %_tmp_3 = sub i32 1, %_tmp_2
  %_tmp_4 = add i32 %_tmp_3, %_tmp_1
  %_tmp_5 = add i32 %_tmp_4, 2
  store i32 %_tmp_5, i32* %A, align 4
  %_tmp_7 = add i32 %_tmp_4, 3
  store i32 %_tmp_7, i32* %C, align 4
  %_printf_format_1 = alloca [10 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 2
  store i8 32, i8* %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 3
  store i8 37, i8* %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 4
  store i8 100, i8* %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 5
  store i8 32, i8* %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 6
  store i8 37, i8* %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 7
  store i8 100, i8* %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 8
  store i8 10, i8* %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [10 x i8], [10 x i8]* %_printf_format_1, i64 0, i64 9
  store i8 0, i8* %.fca.9.gep, align 1
  %_tmp_12 = shl i32 %_tmp_5, 1
  %_tmp_14 = add i32 %_tmp_12, %_tmp_7
  %2 = call i32 (i8*, ...) @printf(i8* nonnull %.fca.0.gep, i32 %_tmp_5, i32 %_tmp_7, i32 %_tmp_14)
  ret i32 0
}

attributes #0 = { nofree nounwind }
