; Declare printf
declare i32 @printf(i8*, ...)

; Declare scanf
declare i32 @scanf(i8*, ...)

define i32 @main() {
	%A = alloca i32
	store i32 1, i32* %A
	%B = alloca i32
	store i32 -2, i32* %B
	%_printf_format_1 = alloca [7 x i8]
	store [7 x i8] c"%d %d\0A\00", [7 x i8]* %_printf_format_1
	%_printf_str_1 = getelementptr [7 x i8], [7 x i8]* %_printf_format_1, i32 0, i32 0
	%_tmp_1 = load i32, i32* %A
	%_tmp_2 = load i32, i32* %B
	call i32 (i8*, ...) @printf(i8* %_printf_str_1, i32 %_tmp_1, i32 %_tmp_2)
	ret i32 0
}
