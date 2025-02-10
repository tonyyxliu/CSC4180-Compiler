; ModuleID = './llvm_ir/test9.ll'
source_filename = "./llvm_ir/test9.ll"

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
declare i32 @scanf(i8* nocapture readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
  %D = alloca i32, align 4
  %_scanf_format_1 = alloca [3 x i8], align 1
  %.fca.0.gep1 = getelementptr inbounds [3 x i8], [3 x i8]* %_scanf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep1, align 1
  %.fca.1.gep2 = getelementptr inbounds [3 x i8], [3 x i8]* %_scanf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep2, align 1
  %.fca.2.gep3 = getelementptr inbounds [3 x i8], [3 x i8]* %_scanf_format_1, i64 0, i64 2
  store i8 0, i8* %.fca.2.gep3, align 1
  %1 = call i32 (i8*, ...) @scanf(i8* nonnull %.fca.0.gep1, i32* nonnull %D)
  %_printf_format_1 = alloca [25 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 0
  store i8 37, i8* %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 1
  store i8 100, i8* %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 2
  store i8 32, i8* %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 3
  store i8 37, i8* %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 4
  store i8 100, i8* %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 5
  store i8 32, i8* %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 6
  store i8 37, i8* %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 7
  store i8 100, i8* %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 8
  store i8 32, i8* %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 9
  store i8 37, i8* %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 10
  store i8 100, i8* %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 11
  store i8 32, i8* %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 12
  store i8 37, i8* %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 13
  store i8 100, i8* %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 14
  store i8 32, i8* %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 15
  store i8 37, i8* %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 16
  store i8 100, i8* %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 17
  store i8 32, i8* %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 18
  store i8 37, i8* %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 19
  store i8 100, i8* %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 20
  store i8 32, i8* %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 21
  store i8 37, i8* %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 22
  store i8 100, i8* %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 23
  store i8 10, i8* %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [25 x i8], [25 x i8]* %_printf_format_1, i64 0, i64 24
  store i8 0, i8* %.fca.24.gep, align 1
  %_tmp_17 = load i32, i32* %D, align 4
  %_tmp_18 = sub i32 1, %_tmp_17
  %2 = call i32 (i8*, ...) @printf(i8* nonnull %.fca.0.gep, i32 3, i32 20, i32 1, i32 %_tmp_18, i32 -19, i32 255, i32 0, i32 0)
  ret i32 0
}

attributes #0 = { nofree nounwind }
