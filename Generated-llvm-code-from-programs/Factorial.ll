; ModuleID = 'Factorial.ll'

%class.Fac = type {}

@.str = private constant [4 x i8] c"%d\0A\00", align 1

define void @main() {
entry:
  br label %0

; <label>:0                                       ; preds = %entry
  br label %1

; <label>:1                                       ; preds = %0
  br label %2

; <label>:2                                       ; preds = %1
  %3 = call noalias i8* @_Znwm(i64 0)
  %4 = bitcast i8* %3 to %class.Fac*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 0, i32 8, i1 false)
  br label %5

; <label>:5                                       ; preds = %2
  %6 = call i32 @ComputeFac(%class.Fac* %4, i32 10)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %6)
  ret void
}

declare i32 @printf(i8*, ...)

declare noalias i8* @_Znam(i64)

declare noalias i8* @_Znwm(i64)

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #0

define linkonce_odr i32 @ComputeFac(%class.Fac* %arg_this, i32 %arg_num) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Fac*
  store %class.Fac* %arg_this, %class.Fac** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %num = alloca i32, align 4
  store i32 %arg_num, i32* %num, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %num_aux = alloca i32, align 4
  br label %4

; <label>:4                                       ; preds = %3
  br label %5

; <label>:5                                       ; preds = %4
  br label %6

; <label>:6                                       ; preds = %5
  %7 = load i32* %num, align 4
  br label %8

; <label>:8                                       ; preds = %6
  %9 = icmp slt i32 %7, 1
  %10 = zext i1 %9 to i8
  %11 = trunc i8 %10 to i1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %8
  br label %14

; <label>:13                                      ; preds = %8
  br label %16

; <label>:14                                      ; preds = %12
  br label %15

; <label>:15                                      ; preds = %14
  store i32 1, i32* %num_aux, align 4
  br label %30

; <label>:16                                      ; preds = %13
  br label %17

; <label>:17                                      ; preds = %16
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i32* %num, align 4
  br label %20

; <label>:20                                      ; preds = %18
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load %class.Fac** %this, align 4
  br label %23

; <label>:23                                      ; preds = %21
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32* %num, align 4
  br label %26

; <label>:26                                      ; preds = %24
  %27 = sub i32 %25, 1
  %28 = call i32 @ComputeFac(%class.Fac* %22, i32 %27)
  %29 = mul i32 %19, %28
  store i32 %29, i32* %num_aux, align 4
  br label %30

; <label>:30                                      ; preds = %15, %26
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32* %num_aux, align 4
  ret i32 %32
}

attributes #0 = { nounwind }
