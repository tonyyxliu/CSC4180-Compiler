; ModuleID = './llvm_ir/test8.ll'
source_filename = "./llvm_ir/test8.ll"

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
  %.fca.0.gep7 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep7, align 1
  %.fca.1.gep8 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep8, align 1
  %.fca.2.gep9 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 2
  store i8 32, i8* %.fca.2.gep9, align 1
  %.fca.3.gep10 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 3
  store i8 37, i8* %.fca.3.gep10, align 1
  %.fca.4.gep11 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 4
  store i8 100, i8* %.fca.4.gep11, align 1
  %.fca.5.gep12 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 5
  store i8 32, i8* %.fca.5.gep12, align 1
  %.fca.6.gep13 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 6
  store i8 37, i8* %.fca.6.gep13, align 1
  %.fca.7.gep14 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 7
  store i8 100, i8* %.fca.7.gep14, align 1
  %.fca.8.gep15 = getelementptr inbounds [9 x i8], [9 x i8]* %_scanf_format_1, i64 0, i64 8
  store i8 0, i8* %.fca.8.gep15, align 1
  %1 = call i32 (i8*, ...) @scanf(i8* nonnull %.fca.0.gep7, i32* nonnull %A, i32* nonnull %B, i32* nonnull %C)
  %_tmp_1 = load i32, i32* %A, align 4
  %_tmp_2 = load i32, i32* %C, align 4
  %_tmp_6 = load i32, i32* %B, align 4
  %_tmp_4 = add i32 %_tmp_6, %_tmp_1
  %_tmp_5 = add i32 %_tmp_4, 5
  %_tmp_7 = sub i32 %_tmp_5, %_tmp_2
  %_tmp_18 = sub i32 100, %_tmp_2
  %_tmp_13 = xor i32 %_tmp_6, -1
  %_tmp_16 = add i32 %_tmp_18, %_tmp_13
  %_tmp_19 = add i32 %_tmp_16, %_tmp_7
  %_tmp_24 = add i32 %_tmp_5, %_tmp_19
  %_tmp_29 = sub i32 %_tmp_24, %_tmp_4
  %_tmp_32 = add i32 %_tmp_29, -1
  %_printf_format_1 = alloca [19 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 2
  store i8 32, i8* %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 3
  store i8 37, i8* %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 4
  store i8 100, i8* %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 5
  store i8 32, i8* %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 6
  store i8 37, i8* %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 7
  store i8 100, i8* %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 8
  store i8 32, i8* %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 9
  store i8 37, i8* %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 10
  store i8 100, i8* %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 11
  store i8 32, i8* %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 12
  store i8 37, i8* %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 13
  store i8 100, i8* %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 14
  store i8 32, i8* %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 15
  store i8 37, i8* %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 16
  store i8 100, i8* %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 17
  store i8 10, i8* %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [19 x i8], [19 x i8]* %_printf_format_1, i64 0, i64 18
  store i8 0, i8* %.fca.18.gep, align 1
  %2 = call i32 (i8*, ...) @printf(i8* nonnull %.fca.0.gep, i32 %_tmp_7, i32 %_tmp_19, i32 %_tmp_24, i32 %_tmp_29, i32 %_tmp_32, i32 %_tmp_29)
  ret i32 0
}

attributes #0 = { nofree nounwind }
