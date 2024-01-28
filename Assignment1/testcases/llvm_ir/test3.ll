; Declare printf
declare i32 @printf(i8*, ...)

; Declare scanf
declare i32 @scanf(i8*, ...)

define i32 @main() {
	%A = alloca i32
	%C = alloca i32
	%_scanf_format_1 = alloca [6 x i8]
	store [6 x i8] c"%d %d\00", [6 x i8]* %_scanf_format_1
	%_scanf_str_1 = getelementptr [6 x i8], [6 x i8]* %_scanf_format_1, i32 0, i32 0
	call i32 (i8*, ...) @scanf(i8* %_scanf_str_1, i32* %A, i32* %C)
	%_tmp_1 = load i32, i32* %A
	%_tmp_2 = load i32, i32* %C
	%_tmp_3 = sub i32 1, %_tmp_2
	%_tmp_4 = add i32 %_tmp_1, %_tmp_3
	%_tmp_5 = add i32 %_tmp_4, 2
	store i32 %_tmp_5, i32* %A
	%_tmp_6 = load i32, i32* %A
	%_tmp_7 = add i32 %_tmp_6, 1
	store i32 %_tmp_7, i32* %C
	%_printf_format_1 = alloca [10 x i8]
	store [10 x i8] c"%d %d %d\0A\00", [10 x i8]* %_printf_format_1
	%_printf_str_1 = getelementptr [10 x i8], [10 x i8]* %_printf_format_1, i32 0, i32 0
	%_tmp_8 = load i32, i32* %A
	%_tmp_9 = load i32, i32* %C
	%_tmp_10 = load i32, i32* %A
	%_tmp_11 = load i32, i32* %A
	%_tmp_12 = add i32 %_tmp_10, %_tmp_11
	%_tmp_13 = load i32, i32* %C
	%_tmp_14 = add i32 %_tmp_12, %_tmp_13
	call i32 (i8*, ...) @printf(i8* %_printf_str_1, i32 %_tmp_8, i32 %_tmp_9, i32 %_tmp_14)
	ret i32 0
}
