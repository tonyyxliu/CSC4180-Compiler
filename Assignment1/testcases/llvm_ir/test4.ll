; Declare printf
declare i32 @printf(i8*, ...)

; Declare scanf
declare i32 @scanf(i8*, ...)

define i32 @main() {
	%_tmp_1 = add i32 1, 1
	%_tmp_2 = add i32 1, %_tmp_1
	%_tmp_3 = add i32 1, %_tmp_2
	%_tmp_4 = add i32 1, %_tmp_3
	%_tmp_5 = add i32 1, %_tmp_4
	%A = alloca i32
	store i32 %_tmp_5, i32* %A
	%_printf_format_1 = alloca [4 x i8]
	store [4 x i8] c"%d\0A\00", [4 x i8]* %_printf_format_1
	%_printf_str_1 = getelementptr [4 x i8], [4 x i8]* %_printf_format_1, i32 0, i32 0
	%_tmp_6 = load i32, i32* %A
	call i32 (i8*, ...) @printf(i8* %_printf_str_1, i32 %_tmp_6)
	ret i32 0
}
