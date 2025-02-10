; Declare printf
declare i32 @printf(i8*, ...)

; Declare scanf
declare i32 @scanf(i8*, ...)

define i32 @main() {
	%A1 = alloca i32
	%_scanf_format_1 = alloca [3 x i8]
	store [3 x i8] c"%d\00", [3 x i8]* %_scanf_format_1
	%_scanf_str_1 = getelementptr [3 x i8], [3 x i8]* %_scanf_format_1, i32 0, i32 0
	call i32 (i8*, ...) @scanf(i8* %_scanf_str_1, i32* %A1)
	%_tmp_1 = load i32, i32* %A1
	%_tmp_2 = add i32 %_tmp_1, 1
	%A2 = alloca i32
	store i32 %_tmp_2, i32* %A2
	%_tmp_3 = load i32, i32* %A2
	%_tmp_4 = add i32 %_tmp_3, 1
	%A3 = alloca i32
	store i32 %_tmp_4, i32* %A3
	%_tmp_5 = load i32, i32* %A3
	%_tmp_6 = add i32 %_tmp_5, 1
	%A4 = alloca i32
	store i32 %_tmp_6, i32* %A4
	%_tmp_7 = load i32, i32* %A4
	%_tmp_8 = add i32 %_tmp_7, 1
	%A5 = alloca i32
	store i32 %_tmp_8, i32* %A5
	%_tmp_9 = load i32, i32* %A5
	%_tmp_10 = add i32 %_tmp_9, 1
	%A6 = alloca i32
	store i32 %_tmp_10, i32* %A6
	%_tmp_11 = load i32, i32* %A6
	%_tmp_12 = add i32 %_tmp_11, 1
	%A7 = alloca i32
	store i32 %_tmp_12, i32* %A7
	%_tmp_13 = load i32, i32* %A7
	%_tmp_14 = add i32 %_tmp_13, 1
	%A8 = alloca i32
	store i32 %_tmp_14, i32* %A8
	%_tmp_15 = load i32, i32* %A8
	%_tmp_16 = add i32 %_tmp_15, 1
	%A9 = alloca i32
	store i32 %_tmp_16, i32* %A9
	%_tmp_17 = load i32, i32* %A9
	%_tmp_18 = add i32 %_tmp_17, 1
	%A10 = alloca i32
	store i32 %_tmp_18, i32* %A10
	%_printf_format_1 = alloca [4 x i8]
	store [4 x i8] c"%d\0A\00", [4 x i8]* %_printf_format_1
	%_printf_str_1 = getelementptr [4 x i8], [4 x i8]* %_printf_format_1, i32 0, i32 0
	%_tmp_19 = load i32, i32* %A1
	%_tmp_20 = load i32, i32* %A2
	%_tmp_21 = add i32 %_tmp_19, %_tmp_20
	%_tmp_22 = load i32, i32* %A3
	%_tmp_23 = add i32 %_tmp_21, %_tmp_22
	%_tmp_24 = load i32, i32* %A4
	%_tmp_25 = add i32 %_tmp_23, %_tmp_24
	%_tmp_26 = load i32, i32* %A5
	%_tmp_27 = add i32 %_tmp_25, %_tmp_26
	%_tmp_28 = load i32, i32* %A6
	%_tmp_29 = add i32 %_tmp_27, %_tmp_28
	%_tmp_30 = load i32, i32* %A7
	%_tmp_31 = add i32 %_tmp_29, %_tmp_30
	%_tmp_32 = load i32, i32* %A8
	%_tmp_33 = add i32 %_tmp_31, %_tmp_32
	%_tmp_34 = load i32, i32* %A9
	%_tmp_35 = add i32 %_tmp_33, %_tmp_34
	%_tmp_36 = load i32, i32* %A10
	%_tmp_37 = add i32 %_tmp_35, %_tmp_36
	call i32 (i8*, ...) @printf(i8* %_printf_str_1, i32 %_tmp_37)
	ret i32 0
}
