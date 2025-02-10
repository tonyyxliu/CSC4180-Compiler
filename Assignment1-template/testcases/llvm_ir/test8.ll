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
	%_tmp_12 = load i32, i32* %D
	%_tmp_13 = add i32 %_tmp_12, 4
	%_tmp_14 = load i32, i32* %B
	%_tmp_15 = add i32 %_tmp_14, 5
	%_tmp_16 = sub i32 %_tmp_13, %_tmp_15
	%_tmp_17 = load i32, i32* %C
	%_tmp_18 = sub i32 100, %_tmp_17
	%_tmp_19 = add i32 %_tmp_16, %_tmp_18
	%E = alloca i32
	store i32 %_tmp_19, i32* %E
	%_tmp_20 = load i32, i32* %C
	%_tmp_21 = load i32, i32* %D
	%_tmp_22 = add i32 %_tmp_20, %_tmp_21
	%_tmp_23 = load i32, i32* %E
	%_tmp_24 = add i32 %_tmp_22, %_tmp_23
	%F = alloca i32
	store i32 %_tmp_24, i32* %F
	%_tmp_25 = load i32, i32* %F
	%_tmp_26 = load i32, i32* %A
	%_tmp_27 = load i32, i32* %B
	%_tmp_28 = add i32 %_tmp_26, %_tmp_27
	%_tmp_29 = sub i32 %_tmp_25, %_tmp_28
	%G = alloca i32
	store i32 %_tmp_29, i32* %G
	%_tmp_30 = load i32, i32* %G
	%_tmp_31 = sub i32 4, 5
	%_tmp_32 = add i32 %_tmp_30, %_tmp_31
	%I = alloca i32
	store i32 %_tmp_32, i32* %I
	%_tmp_33 = load i32, i32* %I
	%_tmp_34 = add i32 %_tmp_33, 1
	%J = alloca i32
	store i32 %_tmp_34, i32* %J
	%_printf_format_1 = alloca [19 x i8]
	store [19 x i8] c"%d %d %d %d %d %d\0A\00", [19 x i8]* %_printf_format_1
	%_printf_str_1 = getelementptr [19 x i8], [19 x i8]* %_printf_format_1, i32 0, i32 0
	%_tmp_35 = load i32, i32* %D
	%_tmp_36 = load i32, i32* %E
	%_tmp_37 = load i32, i32* %F
	%_tmp_38 = load i32, i32* %G
	%_tmp_39 = load i32, i32* %I
	%_tmp_40 = load i32, i32* %J
	call i32 (i8*, ...) @printf(i8* %_printf_str_1, i32 %_tmp_35, i32 %_tmp_36, i32 %_tmp_37, i32 %_tmp_38, i32 %_tmp_39, i32 %_tmp_40)
	ret i32 0
}
