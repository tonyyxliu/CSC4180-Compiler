; Declare printf
declare i32 @printf(i8*, ...)

; Declare scanf
declare i32 @scanf(i8*, ...)

define i32 @main() {
	%A = alloca i32
	store i32 10, i32* %A
	store i32 314, i32* %A
	%_tmp_1 = load i32, i32* %A
	%_tmp_2 = add i32 %_tmp_1, 45
	%B = alloca i32
	store i32 %_tmp_2, i32* %B
	%_tmp_3 = load i32, i32* %A
	%_tmp_4 = sub i32 100, %_tmp_3
	%C = alloca i32
	store i32 %_tmp_4, i32* %C
	%_tmp_5 = load i32, i32* %B
	%_tmp_6 = sub i32 200, %_tmp_5
	%_tmp_7 = add i32 415, %_tmp_6
	%_tmp_8 = load i32, i32* %C
	%_tmp_9 = add i32 %_tmp_7, %_tmp_8
	%_tmp_10 = load i32, i32* %A
	%_tmp_11 = sub i32 %_tmp_9, %_tmp_10
	%D = alloca i32
	store i32 %_tmp_11, i32* %D
	%_printf_format_1 = alloca [4 x i8]
	store [4 x i8] c"%d\0A\00", [4 x i8]* %_printf_format_1
	%_printf_str_1 = getelementptr [4 x i8], [4 x i8]* %_printf_format_1, i32 0, i32 0
	%_tmp_12 = load i32, i32* %D
	call i32 (i8*, ...) @printf(i8* %_printf_str_1, i32 %_tmp_12)
	ret i32 0
}
