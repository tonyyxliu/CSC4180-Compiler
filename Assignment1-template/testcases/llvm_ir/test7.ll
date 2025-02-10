; Declare printf
declare i32 @printf(i8*, ...)

; Declare scanf
declare i32 @scanf(i8*, ...)

define i32 @main() {
	%A = alloca i32
	%B = alloca i32
	%C = alloca i32
	%_scanf_format_1 = alloca [9 x i8]
	store [9 x i8] c"%d %d %d\00", [9 x i8]* %_scanf_format_1
	%_scanf_str_1 = getelementptr [9 x i8], [9 x i8]* %_scanf_format_1, i32 0, i32 0
	call i32 (i8*, ...) @scanf(i8* %_scanf_str_1, i32* %A, i32* %B, i32* %C)
	%_tmp_1 = load i32, i32* %A
	%_tmp_2 = load i32, i32* %C
	%_tmp_3 = sub i32 2, %_tmp_2
	%_tmp_4 = add i32 %_tmp_1, %_tmp_3
	%_tmp_5 = add i32 %_tmp_4, 3
	%_tmp_6 = load i32, i32* %B
	%_tmp_7 = add i32 %_tmp_5, %_tmp_6
	%_tmp_8 = load i32, i32* %A
	%_tmp_9 = load i32, i32* %A
	%_tmp_10 = sub i32 %_tmp_8, %_tmp_9
	%_tmp_11 = sub i32 %_tmp_7, %_tmp_10
	%D = alloca i32
	store i32 %_tmp_11, i32* %D
	%_printf_format_1 = alloca [4 x i8]
	store [4 x i8] c"%d\0A\00", [4 x i8]* %_printf_format_1
	%_printf_str_1 = getelementptr [4 x i8], [4 x i8]* %_printf_format_1, i32 0, i32 0
	%_tmp_12 = load i32, i32* %D
	call i32 (i8*, ...) @printf(i8* %_printf_str_1, i32 %_tmp_12)
	ret i32 0
}
