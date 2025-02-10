; Declare printf
declare i32 @printf(i8*, ...)

; Declare scanf
declare i32 @scanf(i8*, ...)

define i32 @main() {
	%A = alloca i32
	store i32 1, i32* %A
	%B = alloca i32
	store i32 1, i32* %B
	%C = alloca i32
	store i32 1, i32* %C
	%D = alloca i32
	store i32 1, i32* %D
	%E = alloca i32
	store i32 1, i32* %E
	%F = alloca i32
	store i32 1, i32* %F
	%G = alloca i32
	store i32 1, i32* %G
	%H = alloca i32
	store i32 1, i32* %H
	%I = alloca i32
	store i32 1, i32* %I
	%_tmp_1 = load i32, i32* %A
	%_tmp_2 = add i32 1, %_tmp_1
	%_tmp_3 = load i32, i32* %B
	%_tmp_4 = add i32 %_tmp_2, %_tmp_3
	%J = alloca i32
	store i32 %_tmp_4, i32* %J
	%_printf_format_1 = alloca [4 x i8]
	store [4 x i8] c"%d\0A\00", [4 x i8]* %_printf_format_1
	%_printf_str_1 = getelementptr [4 x i8], [4 x i8]* %_printf_format_1, i32 0, i32 0
	%_tmp_5 = load i32, i32* %A
	%_tmp_6 = load i32, i32* %B
	%_tmp_7 = add i32 %_tmp_5, %_tmp_6
	%_tmp_8 = load i32, i32* %C
	%_tmp_9 = add i32 %_tmp_7, %_tmp_8
	%_tmp_10 = load i32, i32* %D
	%_tmp_11 = add i32 %_tmp_9, %_tmp_10
	%_tmp_12 = load i32, i32* %E
	%_tmp_13 = load i32, i32* %F
	%_tmp_14 = add i32 %_tmp_12, %_tmp_13
	%_tmp_15 = load i32, i32* %G
	%_tmp_16 = add i32 %_tmp_14, %_tmp_15
	%_tmp_17 = add i32 %_tmp_11, %_tmp_16
	%_tmp_18 = load i32, i32* %H
	%_tmp_19 = add i32 %_tmp_17, %_tmp_18
	%_tmp_20 = load i32, i32* %I
	%_tmp_21 = add i32 %_tmp_19, %_tmp_20
	%_tmp_22 = load i32, i32* %J
	%_tmp_23 = add i32 %_tmp_21, %_tmp_22
	call i32 (i8*, ...) @printf(i8* %_printf_str_1, i32 %_tmp_23)
	ret i32 0
}
