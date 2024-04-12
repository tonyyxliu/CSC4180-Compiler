; ModuleID = 'runtime.c'
source_filename = "runtime.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

@.str = private unnamed_addr constant [10 x i8] c"size >= 0\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"runtime.c\00", align 1
@__PRETTY_FUNCTION__.oat_alloc_array = private unnamed_addr constant [34 x i8] c"int32_t *oat_alloc_array(int32_t)\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"NULL != str\00", align 1
@__PRETTY_FUNCTION__.array_of_string = private unnamed_addr constant [33 x i8] c"int32_t *array_of_string(char *)\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"len >= 0\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"NULL != arr\00", align 1
@__PRETTY_FUNCTION__.string_of_array = private unnamed_addr constant [33 x i8] c"char *string_of_array(int32_t *)\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"0 != str[i]\00", align 1
@__PRETTY_FUNCTION__.length_of_string = private unnamed_addr constant [33 x i8] c"int32_t length_of_string(char *)\00", align 1
@string_of_int.buf = internal global [128 x i8] zeroinitializer, align 1
@string_of_int.len = internal global i32 0, align 4
@.str.6 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@__PRETTY_FUNCTION__.print_string = private unnamed_addr constant [26 x i8] c"void print_string(char *)\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"true\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32* @oat_malloc(i32 signext %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = call noalias i8* @calloc(i64 %4, i64 1) #6
  %6 = bitcast i8* %5 to i32*
  ret i32* %6
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32* @oat_alloc_array(i32 signext %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  br label %8

7:                                                ; preds = %1
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 signext 24, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__PRETTY_FUNCTION__.oat_alloc_array, i64 0, i64 0)) #7
  unreachable

8:                                                ; preds = %6
  %9 = load i32, i32* %2, align 4
  %10 = add nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = mul i64 4, %11
  %13 = call noalias i8* @malloc(i64 %12) #6
  %14 = bitcast i8* %13 to i32*
  store i32* %14, i32** %3, align 8
  %15 = load i32, i32* %2, align 4
  %16 = load i32*, i32** %3, align 8
  %17 = getelementptr inbounds i32, i32* %16, i64 0
  store i32 %15, i32* %17, align 4
  %18 = load i32*, i32** %3, align 8
  ret i32* %18
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32 signext, i8*) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32* @array_of_string(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  store i8* %0, i8** %2, align 8
  %6 = load i8*, i8** %2, align 8
  %7 = icmp ne i8* null, %6
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  br label %10

9:                                                ; preds = %1
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 signext 35, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__PRETTY_FUNCTION__.array_of_string, i64 0, i64 0)) #7
  unreachable

10:                                               ; preds = %8
  %11 = load i8*, i8** %2, align 8
  %12 = call i64 @strlen(i8* %11) #8
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %3, align 4
  %14 = load i32, i32* %3, align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %10
  br label %18

17:                                               ; preds = %10
  call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 signext 38, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__PRETTY_FUNCTION__.array_of_string, i64 0, i64 0)) #7
  unreachable

18:                                               ; preds = %16
  %19 = load i32, i32* %3, align 4
  %20 = add nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = mul i64 4, %21
  %23 = call noalias i8* @malloc(i64 %22) #6
  %24 = bitcast i8* %23 to i32*
  store i32* %24, i32** %5, align 8
  %25 = load i32, i32* %3, align 4
  %26 = load i32*, i32** %5, align 8
  %27 = getelementptr inbounds i32, i32* %26, i64 0
  store i32 %25, i32* %27, align 4
  store i32 0, i32* %4, align 4
  br label %28

28:                                               ; preds = %44, %18
  %29 = load i32, i32* %4, align 4
  %30 = load i32, i32* %3, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %47

32:                                               ; preds = %28
  %33 = load i8*, i8** %2, align 8
  %34 = load i32, i32* %4, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8* %33, i64 %35
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = load i32*, i32** %5, align 8
  %40 = load i32, i32* %4, align 4
  %41 = add nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32* %39, i64 %42
  store i32 %38, i32* %43, align 4
  br label %44

44:                                               ; preds = %32
  %45 = load i32, i32* %4, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %4, align 4
  br label %28

47:                                               ; preds = %28
  %48 = load i32*, i32** %5, align 8
  ret i32* %48
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: noinline nounwind optnone
define dso_local i8* @string_of_array(i32* %0) #0 {
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  store i32* %0, i32** %2, align 8
  %6 = load i32*, i32** %2, align 8
  %7 = icmp ne i32* null, %6
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  br label %10

9:                                                ; preds = %1
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 signext 53, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__PRETTY_FUNCTION__.string_of_array, i64 0, i64 0)) #7
  unreachable

10:                                               ; preds = %8
  %11 = load i32*, i32** %2, align 8
  %12 = getelementptr inbounds i32, i32* %11, i64 0
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %3, align 4
  %14 = load i32, i32* %3, align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %10
  br label %18

17:                                               ; preds = %10
  call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 signext 56, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__PRETTY_FUNCTION__.string_of_array, i64 0, i64 0)) #7
  unreachable

18:                                               ; preds = %16
  %19 = load i32, i32* %3, align 4
  %20 = add nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = mul i64 1, %21
  %23 = call noalias i8* @malloc(i64 %22) #6
  store i8* %23, i8** %5, align 8
  store i32 0, i32* %4, align 4
  br label %24

24:                                               ; preds = %50, %18
  %25 = load i32, i32* %4, align 4
  %26 = load i32, i32* %3, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %53

28:                                               ; preds = %24
  %29 = load i32*, i32** %2, align 8
  %30 = load i32, i32* %4, align 4
  %31 = add nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %29, i64 %32
  %34 = load i32, i32* %33, align 4
  %35 = trunc i32 %34 to i8
  %36 = load i8*, i8** %5, align 8
  %37 = load i32, i32* %4, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8* %36, i64 %38
  store i8 %35, i8* %39, align 1
  %40 = load i8*, i8** %5, align 8
  %41 = load i32, i32* %4, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %40, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = icmp ne i32 0, %45
  br i1 %46, label %47, label %48

47:                                               ; preds = %28
  br label %49

48:                                               ; preds = %28
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 signext 62, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__PRETTY_FUNCTION__.string_of_array, i64 0, i64 0)) #7
  unreachable

49:                                               ; preds = %47
  br label %50

50:                                               ; preds = %49
  %51 = load i32, i32* %4, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %4, align 4
  br label %24

53:                                               ; preds = %24
  %54 = load i8*, i8** %5, align 8
  %55 = load i32, i32* %3, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %54, i64 %56
  store i8 0, i8* %57, align 1
  %58 = load i8*, i8** %5, align 8
  ret i8* %58
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @length_of_string(i8* %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = icmp ne i8* null, %3
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %7

6:                                                ; preds = %1
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 signext 70, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__PRETTY_FUNCTION__.length_of_string, i64 0, i64 0)) #7
  unreachable

7:                                                ; preds = %5
  %8 = load i8*, i8** %2, align 8
  %9 = call i64 @strlen(i8* %8) #8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone
define dso_local i8* @string_of_int(i32 signext %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = sext i32 %4 to i64
  %6 = call signext i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @string_of_int.buf, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), i64 %5) #6
  store i32 %6, i32* @string_of_int.len, align 4
  %7 = load i32, i32* @string_of_int.len, align 4
  %8 = add nsw i32 %7, 1
  %9 = sext i32 %8 to i64
  %10 = mul i64 1, %9
  %11 = call noalias i8* @malloc(i64 %10) #6
  store i8* %11, i8** %3, align 8
  %12 = load i8*, i8** %3, align 8
  %13 = load i32, i32* @string_of_int.len, align 4
  %14 = sext i32 %13 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %12, i8* align 1 getelementptr inbounds ([128 x i8], [128 x i8]* @string_of_int.buf, i64 0, i64 0), i64 %14, i1 false)
  %15 = load i8*, i8** %3, align 8
  %16 = load i32, i32* @string_of_int.len, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8* %15, i64 %17
  store i8 0, i8* %18, align 1
  %19 = load i8*, i8** %3, align 8
  ret i8* %19
}

; Function Attrs: nounwind
declare dso_local signext i32 @sprintf(i8*, i8*, ...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone
define dso_local i8* @string_cat(i8* %0, i8* %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %8 = load i8*, i8** %3, align 8
  %9 = call i64 @strlen(i8* %8) #8
  store i64 %9, i64* %5, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = call i64 @strlen(i8* %10) #8
  store i64 %11, i64* %6, align 8
  %12 = load i64, i64* %5, align 8
  %13 = load i64, i64* %6, align 8
  %14 = add i64 %12, %13
  %15 = add i64 %14, 1
  %16 = mul i64 1, %15
  %17 = call noalias i8* @malloc(i64 %16) #6
  store i8* %17, i8** %7, align 8
  %18 = load i8*, i8** %7, align 8
  %19 = load i8*, i8** %3, align 8
  %20 = load i64, i64* %5, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %18, i8* align 1 %19, i64 %20, i1 false)
  %21 = load i8*, i8** %7, align 8
  %22 = load i64, i64* %5, align 8
  %23 = getelementptr inbounds i8, i8* %21, i64 %22
  %24 = load i8*, i8** %4, align 8
  %25 = load i64, i64* %6, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %23, i8* align 1 %24, i64 %25, i1 false)
  %26 = load i8*, i8** %7, align 8
  %27 = load i64, i64* %5, align 8
  %28 = load i64, i64* %6, align 8
  %29 = add i64 %27, %28
  %30 = getelementptr inbounds i8, i8* %26, i64 %29
  store i8 0, i8* %30, align 1
  %31 = load i8*, i8** %7, align 8
  ret i8* %31
}

; Function Attrs: noinline nounwind optnone
define dso_local void @print_string(i8* %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = icmp ne i8* null, %3
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %7

6:                                                ; preds = %1
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 signext 95, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__PRETTY_FUNCTION__.print_string, i64 0, i64 0)) #7
  unreachable

7:                                                ; preds = %5
  %8 = load i8*, i8** %2, align 8
  %9 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* %8)
  ret void
}

declare dso_local signext i32 @printf(i8*, ...) #5

; Function Attrs: noinline nounwind optnone
define dso_local void @print_int(i32 signext %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), i64 %4)
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @print_bool(i32 signext %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i64 0, i64 0))
  br label %9

7:                                                ; preds = %1
  %8 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i64 0, i64 0))
  br label %9

9:                                                ; preds = %7, %5
  ret void
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{!"clang version 10.0.0-4ubuntu1~18.04.2 "}
