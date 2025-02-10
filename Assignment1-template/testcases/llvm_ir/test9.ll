; Declare printf
declare i32 @printf(i8*, ...)

; Declare scanf
declare i32 @scanf(i8*, ...)

define i32 @main() {
	%A = alloca i32
	store i32 1, i32* %A
	%_tmp_1 = load i32, i32* %A
	%_tmp_2 = add i32 %_tmp_1, 2
	store i32 %_tmp_2, i32* %A
	%_tmp_3 = load i32, i32* %A
	%_tmp_4 = add i32 %_tmp_3, 5
	%_tmp_5 = load i32, i32* %A
	%_tmp_6 = load i32, i32* %A
	%_tmp_7 = load i32, i32* %A
	%_tmp_8 = add i32 %_tmp_7, -1
	%_tmp_9 = add i32 %_tmp_6, %_tmp_8
	%_tmp_10 = add i32 %_tmp_5, %_tmp_9
	%_tmp_11 = add i32 %_tmp_4, %_tmp_10
	%_tmp_12 = add i32 %_tmp_11, 5
	%_tmp_13 = sub i32 %_tmp_12, 1
	%B = alloca i32
	store i32 %_tmp_13, i32* %B
	%C = alloca i32
	store i32 1, i32* %C
	%D = alloca i32
	%_scanf_format_1 = alloca [3 x i8]
	store [3 x i8] c"%d\00", [3 x i8]* %_scanf_format_1
	%_scanf_str_1 = getelementptr [3 x i8], [3 x i8]* %_scanf_format_1, i32 0, i32 0
	call i32 (i8*, ...) @scanf(i8* %_scanf_str_1, i32* %D)
	%_printf_format_1 = alloca [25 x i8]
	store [25 x i8] c"%d %d %d %d %d %d %d %d\0A\00", [25 x i8]* %_printf_format_1
	%_printf_str_1 = getelementptr [25 x i8], [25 x i8]* %_printf_format_1, i32 0, i32 0
	%_tmp_14 = load i32, i32* %A
	%_tmp_15 = load i32, i32* %B
	%_tmp_16 = load i32, i32* %C
	%_tmp_17 = load i32, i32* %D
	%_tmp_18 = sub i32 1, %_tmp_17
	%_tmp_19 = sub i32 1, 20
	call i32 (i8*, ...) @printf(i8* %_printf_str_1, i32 %_tmp_14, i32 %_tmp_15, i32 %_tmp_16, i32 %_tmp_18, i32 %_tmp_19, i32 255, i32 0, i32 0)
	ret i32 0
}
