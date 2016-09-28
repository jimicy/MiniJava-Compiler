; ModuleID = 'BinaryTree.ll'

%class.BT = type {}
%class.Tree = type { %class.Tree*, %class.Tree*, i32, i8, i8, %class.Tree* }

@.str = private constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private constant [4 x i8] c"%d\0A\00", align 1
@.str2 = private constant [4 x i8] c"%d\0A\00", align 1
@.str3 = private constant [4 x i8] c"%d\0A\00", align 1
@.str4 = private constant [4 x i8] c"%d\0A\00", align 1
@.str5 = private constant [4 x i8] c"%d\0A\00", align 1
@.str6 = private constant [4 x i8] c"%d\0A\00", align 1
@.str7 = private constant [4 x i8] c"%d\0A\00", align 1
@.str8 = private constant [4 x i8] c"%d\0A\00", align 1

define void @main() {
entry:
  br label %0

; <label>:0                                       ; preds = %entry
  br label %1

; <label>:1                                       ; preds = %0
  br label %2

; <label>:2                                       ; preds = %1
  %3 = call noalias i8* @_Znwm(i64 0)
  %4 = bitcast i8* %3 to %class.BT*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 0, i32 8, i1 false)
  %5 = call i32 @Start(%class.BT* %4)
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str8, i32 0, i32 0), i32 %5)
  ret void
}

declare i32 @printf(i8*, ...)

declare noalias i8* @_Znam(i64)

declare noalias i8* @_Znwm(i64)

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #0

define linkonce_odr i32 @Start(%class.BT* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BT*
  store %class.BT* %arg_this, %class.BT** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %root = alloca %class.Tree*
  br label %3

; <label>:3                                       ; preds = %2
  %ntb = alloca i8, align 1
  br label %4

; <label>:4                                       ; preds = %3
  %nti = alloca i32, align 4
  br label %5

; <label>:5                                       ; preds = %4
  br label %6

; <label>:6                                       ; preds = %5
  %7 = call noalias i8* @_Znwm(i64 ptrtoint (%class.Tree* getelementptr (%class.Tree* null, i32 1) to i64))
  %8 = bitcast i8* %7 to %class.Tree*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 ptrtoint (%class.Tree* getelementptr (%class.Tree* null, i32 1) to i64), i32 8, i1 false)
  store %class.Tree* %8, %class.Tree** %root, align 8
  br label %9

; <label>:9                                       ; preds = %6
  br label %10

; <label>:10                                      ; preds = %9
  br label %11

; <label>:11                                      ; preds = %10
  %12 = load %class.Tree** %root, align 4
  br label %13

; <label>:13                                      ; preds = %11
  %14 = call i8 @Init(%class.Tree* %12, i32 16)
  store i8 %14, i8* %ntb, align 1
  br label %15

; <label>:15                                      ; preds = %13
  br label %16

; <label>:16                                      ; preds = %15
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load %class.Tree** %root, align 4
  %19 = call i8 @Print(%class.Tree* %18)
  store i8 %19, i8* %ntb, align 1
  br label %20

; <label>:20                                      ; preds = %17
  br label %21

; <label>:21                                      ; preds = %20
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 100000000)
  br label %23

; <label>:23                                      ; preds = %21
  br label %24

; <label>:24                                      ; preds = %23
  br label %25

; <label>:25                                      ; preds = %24
  %26 = load %class.Tree** %root, align 4
  br label %27

; <label>:27                                      ; preds = %25
  %28 = call i8 @Insert(%class.Tree* %26, i32 8)
  store i8 %28, i8* %ntb, align 1
  br label %29

; <label>:29                                      ; preds = %27
  br label %30

; <label>:30                                      ; preds = %29
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load %class.Tree** %root, align 4
  %33 = call i8 @Print(%class.Tree* %32)
  store i8 %33, i8* %ntb, align 1
  br label %34

; <label>:34                                      ; preds = %31
  br label %35

; <label>:35                                      ; preds = %34
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load %class.Tree** %root, align 4
  br label %38

; <label>:38                                      ; preds = %36
  %39 = call i8 @Insert(%class.Tree* %37, i32 24)
  store i8 %39, i8* %ntb, align 1
  br label %40

; <label>:40                                      ; preds = %38
  br label %41

; <label>:41                                      ; preds = %40
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load %class.Tree** %root, align 4
  br label %44

; <label>:44                                      ; preds = %42
  %45 = call i8 @Insert(%class.Tree* %43, i32 4)
  store i8 %45, i8* %ntb, align 1
  br label %46

; <label>:46                                      ; preds = %44
  br label %47

; <label>:47                                      ; preds = %46
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load %class.Tree** %root, align 4
  br label %50

; <label>:50                                      ; preds = %48
  %51 = call i8 @Insert(%class.Tree* %49, i32 12)
  store i8 %51, i8* %ntb, align 1
  br label %52

; <label>:52                                      ; preds = %50
  br label %53

; <label>:53                                      ; preds = %52
  br label %54

; <label>:54                                      ; preds = %53
  %55 = load %class.Tree** %root, align 4
  br label %56

; <label>:56                                      ; preds = %54
  %57 = call i8 @Insert(%class.Tree* %55, i32 20)
  store i8 %57, i8* %ntb, align 1
  br label %58

; <label>:58                                      ; preds = %56
  br label %59

; <label>:59                                      ; preds = %58
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load %class.Tree** %root, align 4
  br label %62

; <label>:62                                      ; preds = %60
  %63 = call i8 @Insert(%class.Tree* %61, i32 28)
  store i8 %63, i8* %ntb, align 1
  br label %64

; <label>:64                                      ; preds = %62
  br label %65

; <label>:65                                      ; preds = %64
  br label %66

; <label>:66                                      ; preds = %65
  %67 = load %class.Tree** %root, align 4
  br label %68

; <label>:68                                      ; preds = %66
  %69 = call i8 @Insert(%class.Tree* %67, i32 14)
  store i8 %69, i8* %ntb, align 1
  br label %70

; <label>:70                                      ; preds = %68
  br label %71

; <label>:71                                      ; preds = %70
  br label %72

; <label>:72                                      ; preds = %71
  %73 = load %class.Tree** %root, align 4
  %74 = call i8 @Print(%class.Tree* %73)
  store i8 %74, i8* %ntb, align 1
  br label %75

; <label>:75                                      ; preds = %72
  br label %76

; <label>:76                                      ; preds = %75
  br label %77

; <label>:77                                      ; preds = %76
  %78 = load %class.Tree** %root, align 4
  br label %79

; <label>:79                                      ; preds = %77
  %80 = call i32 @Search(%class.Tree* %78, i32 24)
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %80)
  br label %82

; <label>:82                                      ; preds = %79
  br label %83

; <label>:83                                      ; preds = %82
  br label %84

; <label>:84                                      ; preds = %83
  %85 = load %class.Tree** %root, align 4
  br label %86

; <label>:86                                      ; preds = %84
  %87 = call i32 @Search(%class.Tree* %85, i32 12)
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 %87)
  br label %89

; <label>:89                                      ; preds = %86
  br label %90

; <label>:90                                      ; preds = %89
  br label %91

; <label>:91                                      ; preds = %90
  %92 = load %class.Tree** %root, align 4
  br label %93

; <label>:93                                      ; preds = %91
  %94 = call i32 @Search(%class.Tree* %92, i32 16)
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %94)
  br label %96

; <label>:96                                      ; preds = %93
  br label %97

; <label>:97                                      ; preds = %96
  br label %98

; <label>:98                                      ; preds = %97
  %99 = load %class.Tree** %root, align 4
  br label %100

; <label>:100                                     ; preds = %98
  %101 = call i32 @Search(%class.Tree* %99, i32 50)
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %101)
  br label %103

; <label>:103                                     ; preds = %100
  br label %104

; <label>:104                                     ; preds = %103
  br label %105

; <label>:105                                     ; preds = %104
  %106 = load %class.Tree** %root, align 4
  br label %107

; <label>:107                                     ; preds = %105
  %108 = call i32 @Search(%class.Tree* %106, i32 12)
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i32 %108)
  br label %110

; <label>:110                                     ; preds = %107
  br label %111

; <label>:111                                     ; preds = %110
  br label %112

; <label>:112                                     ; preds = %111
  %113 = load %class.Tree** %root, align 4
  br label %114

; <label>:114                                     ; preds = %112
  %115 = call i8 @Delete(%class.Tree* %113, i32 12)
  store i8 %115, i8* %ntb, align 1
  br label %116

; <label>:116                                     ; preds = %114
  br label %117

; <label>:117                                     ; preds = %116
  br label %118

; <label>:118                                     ; preds = %117
  %119 = load %class.Tree** %root, align 4
  %120 = call i8 @Print(%class.Tree* %119)
  store i8 %120, i8* %ntb, align 1
  br label %121

; <label>:121                                     ; preds = %118
  br label %122

; <label>:122                                     ; preds = %121
  br label %123

; <label>:123                                     ; preds = %122
  %124 = load %class.Tree** %root, align 4
  br label %125

; <label>:125                                     ; preds = %123
  %126 = call i32 @Search(%class.Tree* %124, i32 12)
  %127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 %126)
  br label %128

; <label>:128                                     ; preds = %125
  ret i32 0
}

define linkonce_odr i8 @Init(%class.Tree* %arg_this, i32 %arg_v_key) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %v_key = alloca i32, align 4
  store i32 %arg_v_key, i32* %v_key, align 4
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  %5 = load i32* %v_key, align 4
  %6 = load %class.Tree** %this
  %7 = getelementptr %class.Tree* %6, i32 0, i32 2
  store i32 %5, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %8
  %10 = load %class.Tree** %this
  %11 = getelementptr %class.Tree* %10, i32 0, i32 3
  store i8 0, i8* %11, align 1
  br label %12

; <label>:12                                      ; preds = %9
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load %class.Tree** %this
  %15 = getelementptr %class.Tree* %14, i32 0, i32 4
  store i8 0, i8* %15, align 1
  br label %16

; <label>:16                                      ; preds = %13
  ret i8 1
}

define linkonce_odr i8 @SetRight(%class.Tree* %arg_this, %class.Tree* %arg_rn) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %rn = alloca %class.Tree*
  store %class.Tree* %arg_rn, %class.Tree** %rn, align 8
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  %5 = load %class.Tree** %rn, align 4
  %6 = load %class.Tree** %this
  %7 = getelementptr %class.Tree* %6, i32 0, i32 1
  store %class.Tree* %5, %class.Tree** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  ret i8 1
}

define linkonce_odr i8 @SetLeft(%class.Tree* %arg_this, %class.Tree* %arg_ln) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %ln = alloca %class.Tree*
  store %class.Tree* %arg_ln, %class.Tree** %ln, align 8
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  %5 = load %class.Tree** %ln, align 4
  %6 = load %class.Tree** %this
  %7 = getelementptr %class.Tree* %6, i32 0, i32 0
  store %class.Tree* %5, %class.Tree** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  ret i8 1
}

define linkonce_odr %class.Tree* @GetRight(%class.Tree* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %3 = load %class.Tree** %this
  %4 = getelementptr %class.Tree* %3, i32 0, i32 1
  %5 = load %class.Tree** %4, align 4
  ret %class.Tree* %5
}

define linkonce_odr %class.Tree* @GetLeft(%class.Tree* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %3 = load %class.Tree** %this
  %4 = getelementptr %class.Tree* %3, i32 0, i32 0
  %5 = load %class.Tree** %4, align 4
  ret %class.Tree* %5
}

define linkonce_odr i32 @GetKey(%class.Tree* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %3 = load %class.Tree** %this
  %4 = getelementptr %class.Tree* %3, i32 0, i32 2
  %5 = load i32* %4, align 4
  ret i32 %5
}

define linkonce_odr i8 @SetKey(%class.Tree* %arg_this, i32 %arg_v_key) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %v_key = alloca i32, align 4
  store i32 %arg_v_key, i32* %v_key, align 4
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  %5 = load i32* %v_key, align 4
  %6 = load %class.Tree** %this
  %7 = getelementptr %class.Tree* %6, i32 0, i32 2
  store i32 %5, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  ret i8 1
}

define linkonce_odr i8 @GetHas_Right(%class.Tree* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %3 = load %class.Tree** %this
  %4 = getelementptr %class.Tree* %3, i32 0, i32 4
  %5 = load i8* %4, align 4
  ret i8 %5
}

define linkonce_odr i8 @GetHas_Left(%class.Tree* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %3 = load %class.Tree** %this
  %4 = getelementptr %class.Tree* %3, i32 0, i32 3
  %5 = load i8* %4, align 4
  ret i8 %5
}

define linkonce_odr i8 @SetHas_Left(%class.Tree* %arg_this, i8 %arg_val) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %val = alloca i8, align 1
  store i8 %arg_val, i8* %val, align 1
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  %5 = load i8* %val, align 4
  %6 = load %class.Tree** %this
  %7 = getelementptr %class.Tree* %6, i32 0, i32 3
  store i8 %5, i8* %7, align 1
  br label %8

; <label>:8                                       ; preds = %4
  ret i8 1
}

define linkonce_odr i8 @SetHas_Right(%class.Tree* %arg_this, i8 %arg_val) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %val = alloca i8, align 1
  store i8 %arg_val, i8* %val, align 1
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  %5 = load i8* %val, align 4
  %6 = load %class.Tree** %this
  %7 = getelementptr %class.Tree* %6, i32 0, i32 4
  store i8 %5, i8* %7, align 1
  br label %8

; <label>:8                                       ; preds = %4
  ret i8 1
}

define linkonce_odr i8 @Compare(%class.Tree* %arg_this, i32 %arg_num1, i32 %arg_num2) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %num1 = alloca i32, align 4
  store i32 %arg_num1, i32* %num1, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %num2 = alloca i32, align 4
  store i32 %arg_num2, i32* %num2, align 4
  br label %4

; <label>:4                                       ; preds = %3
  %ntb = alloca i8, align 1
  br label %5

; <label>:5                                       ; preds = %4
  %nti = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  br label %7

; <label>:7                                       ; preds = %6
  store i8 0, i8* %ntb, align 1
  br label %8

; <label>:8                                       ; preds = %7
  br label %9

; <label>:9                                       ; preds = %8
  br label %10

; <label>:10                                      ; preds = %9
  %11 = load i32* %num2, align 4
  br label %12

; <label>:12                                      ; preds = %10
  %13 = add i32 %11, 1
  store i32 %13, i32* %nti, align 4
  br label %14

; <label>:14                                      ; preds = %12
  br label %15

; <label>:15                                      ; preds = %14
  br label %16

; <label>:16                                      ; preds = %15
  %17 = load i32* %num1, align 4
  br label %18

; <label>:18                                      ; preds = %16
  %19 = load i32* %num2, align 4
  %20 = icmp slt i32 %17, %19
  %21 = zext i1 %20 to i8
  %22 = trunc i8 %21 to i1
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %18
  br label %25

; <label>:24                                      ; preds = %18
  br label %27

; <label>:25                                      ; preds = %23
  br label %26

; <label>:26                                      ; preds = %25
  store i8 0, i8* %ntb, align 1
  br label %47

; <label>:27                                      ; preds = %24
  br label %28

; <label>:28                                      ; preds = %27
  br label %29

; <label>:29                                      ; preds = %28
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32* %num1, align 4
  br label %32

; <label>:32                                      ; preds = %30
  %33 = load i32* %nti, align 4
  %34 = icmp slt i32 %31, %33
  %35 = zext i1 %34 to i8
  %36 = trunc i8 %35 to i1
  %37 = xor i1 %36, true
  %38 = zext i1 %37 to i8
  %39 = trunc i8 %38 to i1
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %32
  br label %42

; <label>:41                                      ; preds = %32
  br label %44

; <label>:42                                      ; preds = %40
  br label %43

; <label>:43                                      ; preds = %42
  store i8 0, i8* %ntb, align 1
  br label %46

; <label>:44                                      ; preds = %41
  br label %45

; <label>:45                                      ; preds = %44
  store i8 1, i8* %ntb, align 1
  br label %46

; <label>:46                                      ; preds = %43, %45
  br label %47

; <label>:47                                      ; preds = %26, %46
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i8* %ntb, align 4
  ret i8 %49
}

define linkonce_odr i8 @Insert(%class.Tree* %arg_this, i32 %arg_v_key) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %v_key = alloca i32, align 4
  store i32 %arg_v_key, i32* %v_key, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %new_node = alloca %class.Tree*
  br label %4

; <label>:4                                       ; preds = %3
  %ntb = alloca i8, align 1
  br label %5

; <label>:5                                       ; preds = %4
  %cont = alloca i8, align 1
  br label %6

; <label>:6                                       ; preds = %5
  %key_aux = alloca i32, align 4
  br label %7

; <label>:7                                       ; preds = %6
  %current_node = alloca %class.Tree*
  br label %8

; <label>:8                                       ; preds = %7
  br label %9

; <label>:9                                       ; preds = %8
  %10 = call noalias i8* @_Znwm(i64 ptrtoint (%class.Tree* getelementptr (%class.Tree* null, i32 1) to i64))
  %11 = bitcast i8* %10 to %class.Tree*
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 ptrtoint (%class.Tree* getelementptr (%class.Tree* null, i32 1) to i64), i32 8, i1 false)
  store %class.Tree* %11, %class.Tree** %new_node, align 8
  br label %12

; <label>:12                                      ; preds = %9
  br label %13

; <label>:13                                      ; preds = %12
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load %class.Tree** %new_node, align 4
  br label %16

; <label>:16                                      ; preds = %14
  %17 = load i32* %v_key, align 4
  %18 = call i8 @Init(%class.Tree* %15, i32 %17)
  store i8 %18, i8* %ntb, align 1
  br label %19

; <label>:19                                      ; preds = %16
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load %class.Tree** %this, align 4
  store %class.Tree* %21, %class.Tree** %current_node, align 8
  br label %22

; <label>:22                                      ; preds = %20
  br label %23

; <label>:23                                      ; preds = %22
  store i8 1, i8* %cont, align 1
  br label %24

; <label>:24                                      ; preds = %23
  br label %25

; <label>:25                                      ; preds = %110, %24
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load i8* %cont, align 4
  %28 = trunc i8 %27 to i1
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %26
  br label %31

; <label>:30                                      ; preds = %26
  br label %111

; <label>:31                                      ; preds = %29
  br label %32

; <label>:32                                      ; preds = %31
  br label %33

; <label>:33                                      ; preds = %32
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load %class.Tree** %current_node, align 4
  %36 = call i32 @GetKey(%class.Tree* %35)
  store i32 %36, i32* %key_aux, align 4
  br label %37

; <label>:37                                      ; preds = %34
  br label %38

; <label>:38                                      ; preds = %37
  br label %39

; <label>:39                                      ; preds = %38
  %40 = load i32* %v_key, align 4
  br label %41

; <label>:41                                      ; preds = %39
  %42 = load i32* %key_aux, align 4
  %43 = icmp slt i32 %40, %42
  %44 = zext i1 %43 to i8
  %45 = trunc i8 %44 to i1
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %41
  br label %48

; <label>:47                                      ; preds = %41
  br label %79

; <label>:48                                      ; preds = %46
  br label %49

; <label>:49                                      ; preds = %48
  br label %50

; <label>:50                                      ; preds = %49
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load %class.Tree** %current_node, align 4
  %53 = call i8 @GetHas_Left(%class.Tree* %52)
  %54 = trunc i8 %53 to i1
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %51
  br label %57

; <label>:56                                      ; preds = %51
  br label %62

; <label>:57                                      ; preds = %55
  br label %58

; <label>:58                                      ; preds = %57
  br label %59

; <label>:59                                      ; preds = %58
  %60 = load %class.Tree** %current_node, align 4
  %61 = call %class.Tree* @GetLeft(%class.Tree* %60)
  store %class.Tree* %61, %class.Tree** %current_node, align 8
  br label %78

; <label>:62                                      ; preds = %56
  br label %63

; <label>:63                                      ; preds = %62
  br label %64

; <label>:64                                      ; preds = %63
  store i8 0, i8* %cont, align 1
  br label %65

; <label>:65                                      ; preds = %64
  br label %66

; <label>:66                                      ; preds = %65
  br label %67

; <label>:67                                      ; preds = %66
  %68 = load %class.Tree** %current_node, align 4
  br label %69

; <label>:69                                      ; preds = %67
  %70 = call i8 @SetHas_Left(%class.Tree* %68, i8 1)
  store i8 %70, i8* %ntb, align 1
  br label %71

; <label>:71                                      ; preds = %69
  br label %72

; <label>:72                                      ; preds = %71
  br label %73

; <label>:73                                      ; preds = %72
  %74 = load %class.Tree** %current_node, align 4
  br label %75

; <label>:75                                      ; preds = %73
  %76 = load %class.Tree** %new_node, align 4
  %77 = call i8 @SetLeft(%class.Tree* %74, %class.Tree* %76)
  store i8 %77, i8* %ntb, align 1
  br label %78

; <label>:78                                      ; preds = %59, %75
  br label %110

; <label>:79                                      ; preds = %47
  br label %80

; <label>:80                                      ; preds = %79
  br label %81

; <label>:81                                      ; preds = %80
  br label %82

; <label>:82                                      ; preds = %81
  %83 = load %class.Tree** %current_node, align 4
  %84 = call i8 @GetHas_Right(%class.Tree* %83)
  %85 = trunc i8 %84 to i1
  br i1 %85, label %86, label %87

; <label>:86                                      ; preds = %82
  br label %88

; <label>:87                                      ; preds = %82
  br label %93

; <label>:88                                      ; preds = %86
  br label %89

; <label>:89                                      ; preds = %88
  br label %90

; <label>:90                                      ; preds = %89
  %91 = load %class.Tree** %current_node, align 4
  %92 = call %class.Tree* @GetRight(%class.Tree* %91)
  store %class.Tree* %92, %class.Tree** %current_node, align 8
  br label %109

; <label>:93                                      ; preds = %87
  br label %94

; <label>:94                                      ; preds = %93
  br label %95

; <label>:95                                      ; preds = %94
  store i8 0, i8* %cont, align 1
  br label %96

; <label>:96                                      ; preds = %95
  br label %97

; <label>:97                                      ; preds = %96
  br label %98

; <label>:98                                      ; preds = %97
  %99 = load %class.Tree** %current_node, align 4
  br label %100

; <label>:100                                     ; preds = %98
  %101 = call i8 @SetHas_Right(%class.Tree* %99, i8 1)
  store i8 %101, i8* %ntb, align 1
  br label %102

; <label>:102                                     ; preds = %100
  br label %103

; <label>:103                                     ; preds = %102
  br label %104

; <label>:104                                     ; preds = %103
  %105 = load %class.Tree** %current_node, align 4
  br label %106

; <label>:106                                     ; preds = %104
  %107 = load %class.Tree** %new_node, align 4
  %108 = call i8 @SetRight(%class.Tree* %105, %class.Tree* %107)
  store i8 %108, i8* %ntb, align 1
  br label %109

; <label>:109                                     ; preds = %90, %106
  br label %110

; <label>:110                                     ; preds = %78, %109
  br label %25

; <label>:111                                     ; preds = %30
  ret i8 1
}

define linkonce_odr i8 @Delete(%class.Tree* %arg_this, i32 %arg_v_key) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %v_key = alloca i32, align 4
  store i32 %arg_v_key, i32* %v_key, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %current_node = alloca %class.Tree*
  br label %4

; <label>:4                                       ; preds = %3
  %parent_node = alloca %class.Tree*
  br label %5

; <label>:5                                       ; preds = %4
  %cont = alloca i8, align 1
  br label %6

; <label>:6                                       ; preds = %5
  %found = alloca i8, align 1
  br label %7

; <label>:7                                       ; preds = %6
  %is_root = alloca i8, align 1
  br label %8

; <label>:8                                       ; preds = %7
  %key_aux = alloca i32, align 4
  br label %9

; <label>:9                                       ; preds = %8
  %ntb = alloca i8, align 1
  br label %10

; <label>:10                                      ; preds = %9
  br label %11

; <label>:11                                      ; preds = %10
  %12 = load %class.Tree** %this, align 4
  store %class.Tree* %12, %class.Tree** %current_node, align 8
  br label %13

; <label>:13                                      ; preds = %11
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load %class.Tree** %this, align 4
  store %class.Tree* %15, %class.Tree** %parent_node, align 8
  br label %16

; <label>:16                                      ; preds = %14
  br label %17

; <label>:17                                      ; preds = %16
  store i8 1, i8* %cont, align 1
  br label %18

; <label>:18                                      ; preds = %17
  br label %19

; <label>:19                                      ; preds = %18
  store i8 0, i8* %found, align 1
  br label %20

; <label>:20                                      ; preds = %19
  br label %21

; <label>:21                                      ; preds = %20
  store i8 1, i8* %is_root, align 1
  br label %22

; <label>:22                                      ; preds = %21
  br label %23

; <label>:23                                      ; preds = %155, %22
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i8* %cont, align 4
  %26 = trunc i8 %25 to i1
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %24
  br label %29

; <label>:28                                      ; preds = %24
  br label %156

; <label>:29                                      ; preds = %27
  br label %30

; <label>:30                                      ; preds = %29
  br label %31

; <label>:31                                      ; preds = %30
  br label %32

; <label>:32                                      ; preds = %31
  %33 = load %class.Tree** %current_node, align 4
  %34 = call i32 @GetKey(%class.Tree* %33)
  store i32 %34, i32* %key_aux, align 4
  br label %35

; <label>:35                                      ; preds = %32
  br label %36

; <label>:36                                      ; preds = %35
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %v_key, align 4
  br label %39

; <label>:39                                      ; preds = %37
  %40 = load i32* %key_aux, align 4
  %41 = icmp slt i32 %38, %40
  %42 = zext i1 %41 to i8
  %43 = trunc i8 %42 to i1
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %39
  br label %46

; <label>:45                                      ; preds = %39
  br label %66

; <label>:46                                      ; preds = %44
  br label %47

; <label>:47                                      ; preds = %46
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load %class.Tree** %current_node, align 4
  %50 = call i8 @GetHas_Left(%class.Tree* %49)
  %51 = trunc i8 %50 to i1
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %48
  br label %54

; <label>:53                                      ; preds = %48
  br label %63

; <label>:54                                      ; preds = %52
  br label %55

; <label>:55                                      ; preds = %54
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load %class.Tree** %current_node, align 4
  store %class.Tree* %57, %class.Tree** %parent_node, align 8
  br label %58

; <label>:58                                      ; preds = %56
  br label %59

; <label>:59                                      ; preds = %58
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load %class.Tree** %current_node, align 4
  %62 = call %class.Tree* @GetLeft(%class.Tree* %61)
  store %class.Tree* %62, %class.Tree** %current_node, align 8
  br label %65

; <label>:63                                      ; preds = %53
  br label %64

; <label>:64                                      ; preds = %63
  store i8 0, i8* %cont, align 1
  br label %65

; <label>:65                                      ; preds = %60, %64
  br label %153

; <label>:66                                      ; preds = %45
  br label %67

; <label>:67                                      ; preds = %66
  br label %68

; <label>:68                                      ; preds = %67
  %69 = load i32* %key_aux, align 4
  br label %70

; <label>:70                                      ; preds = %68
  %71 = load i32* %v_key, align 4
  %72 = icmp slt i32 %69, %71
  %73 = zext i1 %72 to i8
  %74 = trunc i8 %73 to i1
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %70
  br label %77

; <label>:76                                      ; preds = %70
  br label %97

; <label>:77                                      ; preds = %75
  br label %78

; <label>:78                                      ; preds = %77
  br label %79

; <label>:79                                      ; preds = %78
  %80 = load %class.Tree** %current_node, align 4
  %81 = call i8 @GetHas_Right(%class.Tree* %80)
  %82 = trunc i8 %81 to i1
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %79
  br label %85

; <label>:84                                      ; preds = %79
  br label %94

; <label>:85                                      ; preds = %83
  br label %86

; <label>:86                                      ; preds = %85
  br label %87

; <label>:87                                      ; preds = %86
  %88 = load %class.Tree** %current_node, align 4
  store %class.Tree* %88, %class.Tree** %parent_node, align 8
  br label %89

; <label>:89                                      ; preds = %87
  br label %90

; <label>:90                                      ; preds = %89
  br label %91

; <label>:91                                      ; preds = %90
  %92 = load %class.Tree** %current_node, align 4
  %93 = call %class.Tree* @GetRight(%class.Tree* %92)
  store %class.Tree* %93, %class.Tree** %current_node, align 8
  br label %96

; <label>:94                                      ; preds = %84
  br label %95

; <label>:95                                      ; preds = %94
  store i8 0, i8* %cont, align 1
  br label %96

; <label>:96                                      ; preds = %91, %95
  br label %152

; <label>:97                                      ; preds = %76
  br label %98

; <label>:98                                      ; preds = %97
  br label %99

; <label>:99                                      ; preds = %98
  %100 = load i8* %is_root, align 4
  %101 = trunc i8 %100 to i1
  br i1 %101, label %102, label %103

; <label>:102                                     ; preds = %99
  br label %104

; <label>:103                                     ; preds = %99
  br label %138

; <label>:104                                     ; preds = %102
  br label %105

; <label>:105                                     ; preds = %104
  br label %106

; <label>:106                                     ; preds = %105
  br label %107

; <label>:107                                     ; preds = %106
  br label %108

; <label>:108                                     ; preds = %107
  %109 = load %class.Tree** %current_node, align 4
  %110 = call i8 @GetHas_Right(%class.Tree* %109)
  %111 = trunc i8 %110 to i1
  %112 = xor i1 %111, true
  %113 = zext i1 %112 to i8
  br label %114

; <label>:114                                     ; preds = %108
  br label %115

; <label>:115                                     ; preds = %114
  br label %116

; <label>:116                                     ; preds = %115
  %117 = load %class.Tree** %current_node, align 4
  %118 = call i8 @GetHas_Left(%class.Tree* %117)
  %119 = trunc i8 %118 to i1
  %120 = xor i1 %119, true
  %121 = zext i1 %120 to i8
  %122 = and i8 %113, %121
  %123 = trunc i8 %122 to i1
  br i1 %123, label %124, label %125

; <label>:124                                     ; preds = %116
  br label %126

; <label>:125                                     ; preds = %116
  br label %128

; <label>:126                                     ; preds = %124
  br label %127

; <label>:127                                     ; preds = %126
  store i8 1, i8* %ntb, align 1
  br label %137

; <label>:128                                     ; preds = %125
  br label %129

; <label>:129                                     ; preds = %128
  br label %130

; <label>:130                                     ; preds = %129
  %131 = load %class.Tree** %this, align 4
  br label %132

; <label>:132                                     ; preds = %130
  %133 = load %class.Tree** %parent_node, align 4
  br label %134

; <label>:134                                     ; preds = %132
  %135 = load %class.Tree** %current_node, align 4
  %136 = call i8 @Remove(%class.Tree* %131, %class.Tree* %133, %class.Tree* %135)
  store i8 %136, i8* %ntb, align 1
  br label %137

; <label>:137                                     ; preds = %127, %134
  br label %147

; <label>:138                                     ; preds = %103
  br label %139

; <label>:139                                     ; preds = %138
  br label %140

; <label>:140                                     ; preds = %139
  %141 = load %class.Tree** %this, align 4
  br label %142

; <label>:142                                     ; preds = %140
  %143 = load %class.Tree** %parent_node, align 4
  br label %144

; <label>:144                                     ; preds = %142
  %145 = load %class.Tree** %current_node, align 4
  %146 = call i8 @Remove(%class.Tree* %141, %class.Tree* %143, %class.Tree* %145)
  store i8 %146, i8* %ntb, align 1
  br label %147

; <label>:147                                     ; preds = %137, %144
  br label %148

; <label>:148                                     ; preds = %147
  br label %149

; <label>:149                                     ; preds = %148
  store i8 1, i8* %found, align 1
  br label %150

; <label>:150                                     ; preds = %149
  br label %151

; <label>:151                                     ; preds = %150
  store i8 0, i8* %cont, align 1
  br label %152

; <label>:152                                     ; preds = %96, %151
  br label %153

; <label>:153                                     ; preds = %65, %152
  br label %154

; <label>:154                                     ; preds = %153
  br label %155

; <label>:155                                     ; preds = %154
  store i8 0, i8* %is_root, align 1
  br label %23

; <label>:156                                     ; preds = %28
  %157 = load i8* %found, align 4
  ret i8 %157
}

define linkonce_odr i8 @Remove(%class.Tree* %arg_this, %class.Tree* %arg_p_node, %class.Tree* %arg_c_node) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %p_node = alloca %class.Tree*
  store %class.Tree* %arg_p_node, %class.Tree** %p_node, align 8
  br label %3

; <label>:3                                       ; preds = %2
  %c_node = alloca %class.Tree*
  store %class.Tree* %arg_c_node, %class.Tree** %c_node, align 8
  br label %4

; <label>:4                                       ; preds = %3
  %ntb = alloca i8, align 1
  br label %5

; <label>:5                                       ; preds = %4
  %auxkey1 = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  %auxkey2 = alloca i32, align 4
  br label %7

; <label>:7                                       ; preds = %6
  br label %8

; <label>:8                                       ; preds = %7
  br label %9

; <label>:9                                       ; preds = %8
  %10 = load %class.Tree** %c_node, align 4
  %11 = call i8 @GetHas_Left(%class.Tree* %10)
  %12 = trunc i8 %11 to i1
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %9
  br label %15

; <label>:14                                      ; preds = %9
  br label %24

; <label>:15                                      ; preds = %13
  br label %16

; <label>:16                                      ; preds = %15
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load %class.Tree** %this, align 4
  br label %19

; <label>:19                                      ; preds = %17
  %20 = load %class.Tree** %p_node, align 4
  br label %21

; <label>:21                                      ; preds = %19
  %22 = load %class.Tree** %c_node, align 4
  %23 = call i8 @RemoveLeft(%class.Tree* %18, %class.Tree* %20, %class.Tree* %22)
  store i8 %23, i8* %ntb, align 1
  br label %100

; <label>:24                                      ; preds = %14
  br label %25

; <label>:25                                      ; preds = %24
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load %class.Tree** %c_node, align 4
  %28 = call i8 @GetHas_Right(%class.Tree* %27)
  %29 = trunc i8 %28 to i1
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %26
  br label %32

; <label>:31                                      ; preds = %26
  br label %41

; <label>:32                                      ; preds = %30
  br label %33

; <label>:33                                      ; preds = %32
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load %class.Tree** %this, align 4
  br label %36

; <label>:36                                      ; preds = %34
  %37 = load %class.Tree** %p_node, align 4
  br label %38

; <label>:38                                      ; preds = %36
  %39 = load %class.Tree** %c_node, align 4
  %40 = call i8 @RemoveRight(%class.Tree* %35, %class.Tree* %37, %class.Tree* %39)
  store i8 %40, i8* %ntb, align 1
  br label %99

; <label>:41                                      ; preds = %31
  br label %42

; <label>:42                                      ; preds = %41
  br label %43

; <label>:43                                      ; preds = %42
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load %class.Tree** %c_node, align 4
  %46 = call i32 @GetKey(%class.Tree* %45)
  store i32 %46, i32* %auxkey1, align 4
  br label %47

; <label>:47                                      ; preds = %44
  br label %48

; <label>:48                                      ; preds = %47
  br label %49

; <label>:49                                      ; preds = %48
  br label %50

; <label>:50                                      ; preds = %49
  %51 = load %class.Tree** %p_node, align 4
  %52 = call %class.Tree* @GetLeft(%class.Tree* %51)
  %53 = call i32 @GetKey(%class.Tree* %52)
  store i32 %53, i32* %auxkey2, align 4
  br label %54

; <label>:54                                      ; preds = %50
  br label %55

; <label>:55                                      ; preds = %54
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load %class.Tree** %this, align 4
  br label %58

; <label>:58                                      ; preds = %56
  %59 = load i32* %auxkey1, align 4
  br label %60

; <label>:60                                      ; preds = %58
  %61 = load i32* %auxkey2, align 4
  %62 = call i8 @Compare(%class.Tree* %57, i32 %59, i32 %61)
  %63 = trunc i8 %62 to i1
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %60
  br label %66

; <label>:65                                      ; preds = %60
  br label %82

; <label>:66                                      ; preds = %64
  br label %67

; <label>:67                                      ; preds = %66
  br label %68

; <label>:68                                      ; preds = %67
  br label %69

; <label>:69                                      ; preds = %68
  %70 = load %class.Tree** %p_node, align 4
  br label %71

; <label>:71                                      ; preds = %69
  %72 = load %class.Tree** %this
  %73 = getelementptr %class.Tree* %72, i32 0, i32 5
  %74 = load %class.Tree** %73, align 4
  %75 = call i8 @SetLeft(%class.Tree* %70, %class.Tree* %74)
  store i8 %75, i8* %ntb, align 1
  br label %76

; <label>:76                                      ; preds = %71
  br label %77

; <label>:77                                      ; preds = %76
  br label %78

; <label>:78                                      ; preds = %77
  %79 = load %class.Tree** %p_node, align 4
  br label %80

; <label>:80                                      ; preds = %78
  %81 = call i8 @SetHas_Left(%class.Tree* %79, i8 0)
  store i8 %81, i8* %ntb, align 1
  br label %98

; <label>:82                                      ; preds = %65
  br label %83

; <label>:83                                      ; preds = %82
  br label %84

; <label>:84                                      ; preds = %83
  br label %85

; <label>:85                                      ; preds = %84
  %86 = load %class.Tree** %p_node, align 4
  br label %87

; <label>:87                                      ; preds = %85
  %88 = load %class.Tree** %this
  %89 = getelementptr %class.Tree* %88, i32 0, i32 5
  %90 = load %class.Tree** %89, align 4
  %91 = call i8 @SetRight(%class.Tree* %86, %class.Tree* %90)
  store i8 %91, i8* %ntb, align 1
  br label %92

; <label>:92                                      ; preds = %87
  br label %93

; <label>:93                                      ; preds = %92
  br label %94

; <label>:94                                      ; preds = %93
  %95 = load %class.Tree** %p_node, align 4
  br label %96

; <label>:96                                      ; preds = %94
  %97 = call i8 @SetHas_Right(%class.Tree* %95, i8 0)
  store i8 %97, i8* %ntb, align 1
  br label %98

; <label>:98                                      ; preds = %80, %96
  br label %99

; <label>:99                                      ; preds = %38, %98
  br label %100

; <label>:100                                     ; preds = %21, %99
  br label %101

; <label>:101                                     ; preds = %100
  ret i8 1
}

define linkonce_odr i8 @RemoveRight(%class.Tree* %arg_this, %class.Tree* %arg_p_node, %class.Tree* %arg_c_node) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %p_node = alloca %class.Tree*
  store %class.Tree* %arg_p_node, %class.Tree** %p_node, align 8
  br label %3

; <label>:3                                       ; preds = %2
  %c_node = alloca %class.Tree*
  store %class.Tree* %arg_c_node, %class.Tree** %c_node, align 8
  br label %4

; <label>:4                                       ; preds = %3
  %ntb = alloca i8, align 1
  br label %5

; <label>:5                                       ; preds = %4
  br label %6

; <label>:6                                       ; preds = %31, %5
  br label %7

; <label>:7                                       ; preds = %6
  br label %8

; <label>:8                                       ; preds = %7
  %9 = load %class.Tree** %c_node, align 4
  %10 = call i8 @GetHas_Right(%class.Tree* %9)
  %11 = trunc i8 %10 to i1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %8
  br label %14

; <label>:13                                      ; preds = %8
  br label %34

; <label>:14                                      ; preds = %12
  br label %15

; <label>:15                                      ; preds = %14
  br label %16

; <label>:16                                      ; preds = %15
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load %class.Tree** %c_node, align 4
  br label %19

; <label>:19                                      ; preds = %17
  br label %20

; <label>:20                                      ; preds = %19
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load %class.Tree** %c_node, align 4
  %23 = call %class.Tree* @GetRight(%class.Tree* %22)
  %24 = call i32 @GetKey(%class.Tree* %23)
  %25 = call i8 @SetKey(%class.Tree* %18, i32 %24)
  store i8 %25, i8* %ntb, align 1
  br label %26

; <label>:26                                      ; preds = %21
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load %class.Tree** %c_node, align 4
  store %class.Tree* %28, %class.Tree** %p_node, align 8
  br label %29

; <label>:29                                      ; preds = %27
  br label %30

; <label>:30                                      ; preds = %29
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load %class.Tree** %c_node, align 4
  %33 = call %class.Tree* @GetRight(%class.Tree* %32)
  store %class.Tree* %33, %class.Tree** %c_node, align 8
  br label %6

; <label>:34                                      ; preds = %13
  br label %35

; <label>:35                                      ; preds = %34
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load %class.Tree** %p_node, align 4
  br label %38

; <label>:38                                      ; preds = %36
  %39 = load %class.Tree** %this
  %40 = getelementptr %class.Tree* %39, i32 0, i32 5
  %41 = load %class.Tree** %40, align 4
  %42 = call i8 @SetRight(%class.Tree* %37, %class.Tree* %41)
  store i8 %42, i8* %ntb, align 1
  br label %43

; <label>:43                                      ; preds = %38
  br label %44

; <label>:44                                      ; preds = %43
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load %class.Tree** %p_node, align 4
  br label %47

; <label>:47                                      ; preds = %45
  %48 = call i8 @SetHas_Right(%class.Tree* %46, i8 0)
  store i8 %48, i8* %ntb, align 1
  br label %49

; <label>:49                                      ; preds = %47
  ret i8 1
}

define linkonce_odr i8 @RemoveLeft(%class.Tree* %arg_this, %class.Tree* %arg_p_node, %class.Tree* %arg_c_node) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %p_node = alloca %class.Tree*
  store %class.Tree* %arg_p_node, %class.Tree** %p_node, align 8
  br label %3

; <label>:3                                       ; preds = %2
  %c_node = alloca %class.Tree*
  store %class.Tree* %arg_c_node, %class.Tree** %c_node, align 8
  br label %4

; <label>:4                                       ; preds = %3
  %ntb = alloca i8, align 1
  br label %5

; <label>:5                                       ; preds = %4
  br label %6

; <label>:6                                       ; preds = %31, %5
  br label %7

; <label>:7                                       ; preds = %6
  br label %8

; <label>:8                                       ; preds = %7
  %9 = load %class.Tree** %c_node, align 4
  %10 = call i8 @GetHas_Left(%class.Tree* %9)
  %11 = trunc i8 %10 to i1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %8
  br label %14

; <label>:13                                      ; preds = %8
  br label %34

; <label>:14                                      ; preds = %12
  br label %15

; <label>:15                                      ; preds = %14
  br label %16

; <label>:16                                      ; preds = %15
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load %class.Tree** %c_node, align 4
  br label %19

; <label>:19                                      ; preds = %17
  br label %20

; <label>:20                                      ; preds = %19
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load %class.Tree** %c_node, align 4
  %23 = call %class.Tree* @GetLeft(%class.Tree* %22)
  %24 = call i32 @GetKey(%class.Tree* %23)
  %25 = call i8 @SetKey(%class.Tree* %18, i32 %24)
  store i8 %25, i8* %ntb, align 1
  br label %26

; <label>:26                                      ; preds = %21
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load %class.Tree** %c_node, align 4
  store %class.Tree* %28, %class.Tree** %p_node, align 8
  br label %29

; <label>:29                                      ; preds = %27
  br label %30

; <label>:30                                      ; preds = %29
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load %class.Tree** %c_node, align 4
  %33 = call %class.Tree* @GetLeft(%class.Tree* %32)
  store %class.Tree* %33, %class.Tree** %c_node, align 8
  br label %6

; <label>:34                                      ; preds = %13
  br label %35

; <label>:35                                      ; preds = %34
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load %class.Tree** %p_node, align 4
  br label %38

; <label>:38                                      ; preds = %36
  %39 = load %class.Tree** %this
  %40 = getelementptr %class.Tree* %39, i32 0, i32 5
  %41 = load %class.Tree** %40, align 4
  %42 = call i8 @SetLeft(%class.Tree* %37, %class.Tree* %41)
  store i8 %42, i8* %ntb, align 1
  br label %43

; <label>:43                                      ; preds = %38
  br label %44

; <label>:44                                      ; preds = %43
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load %class.Tree** %p_node, align 4
  br label %47

; <label>:47                                      ; preds = %45
  %48 = call i8 @SetHas_Left(%class.Tree* %46, i8 0)
  store i8 %48, i8* %ntb, align 1
  br label %49

; <label>:49                                      ; preds = %47
  ret i8 1
}

define linkonce_odr i32 @Search(%class.Tree* %arg_this, i32 %arg_v_key) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %v_key = alloca i32, align 4
  store i32 %arg_v_key, i32* %v_key, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %cont = alloca i8, align 1
  br label %4

; <label>:4                                       ; preds = %3
  %ifound = alloca i32, align 4
  br label %5

; <label>:5                                       ; preds = %4
  %current_node = alloca %class.Tree*
  br label %6

; <label>:6                                       ; preds = %5
  %key_aux = alloca i32, align 4
  br label %7

; <label>:7                                       ; preds = %6
  br label %8

; <label>:8                                       ; preds = %7
  %9 = load %class.Tree** %this, align 4
  store %class.Tree* %9, %class.Tree** %current_node, align 8
  br label %10

; <label>:10                                      ; preds = %8
  br label %11

; <label>:11                                      ; preds = %10
  store i8 1, i8* %cont, align 1
  br label %12

; <label>:12                                      ; preds = %11
  br label %13

; <label>:13                                      ; preds = %12
  store i32 0, i32* %ifound, align 4
  br label %14

; <label>:14                                      ; preds = %13
  br label %15

; <label>:15                                      ; preds = %87, %14
  br label %16

; <label>:16                                      ; preds = %15
  %17 = load i8* %cont, align 4
  %18 = trunc i8 %17 to i1
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  br label %21

; <label>:20                                      ; preds = %16
  br label %88

; <label>:21                                      ; preds = %19
  br label %22

; <label>:22                                      ; preds = %21
  br label %23

; <label>:23                                      ; preds = %22
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load %class.Tree** %current_node, align 4
  %26 = call i32 @GetKey(%class.Tree* %25)
  store i32 %26, i32* %key_aux, align 4
  br label %27

; <label>:27                                      ; preds = %24
  br label %28

; <label>:28                                      ; preds = %27
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load i32* %v_key, align 4
  br label %31

; <label>:31                                      ; preds = %29
  %32 = load i32* %key_aux, align 4
  %33 = icmp slt i32 %30, %32
  %34 = zext i1 %33 to i8
  %35 = trunc i8 %34 to i1
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %31
  br label %38

; <label>:37                                      ; preds = %31
  br label %54

; <label>:38                                      ; preds = %36
  br label %39

; <label>:39                                      ; preds = %38
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load %class.Tree** %current_node, align 4
  %42 = call i8 @GetHas_Left(%class.Tree* %41)
  %43 = trunc i8 %42 to i1
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %40
  br label %46

; <label>:45                                      ; preds = %40
  br label %51

; <label>:46                                      ; preds = %44
  br label %47

; <label>:47                                      ; preds = %46
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load %class.Tree** %current_node, align 4
  %50 = call %class.Tree* @GetLeft(%class.Tree* %49)
  store %class.Tree* %50, %class.Tree** %current_node, align 8
  br label %53

; <label>:51                                      ; preds = %45
  br label %52

; <label>:52                                      ; preds = %51
  store i8 0, i8* %cont, align 1
  br label %53

; <label>:53                                      ; preds = %48, %52
  br label %87

; <label>:54                                      ; preds = %37
  br label %55

; <label>:55                                      ; preds = %54
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load i32* %key_aux, align 4
  br label %58

; <label>:58                                      ; preds = %56
  %59 = load i32* %v_key, align 4
  %60 = icmp slt i32 %57, %59
  %61 = zext i1 %60 to i8
  %62 = trunc i8 %61 to i1
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %58
  br label %65

; <label>:64                                      ; preds = %58
  br label %81

; <label>:65                                      ; preds = %63
  br label %66

; <label>:66                                      ; preds = %65
  br label %67

; <label>:67                                      ; preds = %66
  %68 = load %class.Tree** %current_node, align 4
  %69 = call i8 @GetHas_Right(%class.Tree* %68)
  %70 = trunc i8 %69 to i1
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %67
  br label %73

; <label>:72                                      ; preds = %67
  br label %78

; <label>:73                                      ; preds = %71
  br label %74

; <label>:74                                      ; preds = %73
  br label %75

; <label>:75                                      ; preds = %74
  %76 = load %class.Tree** %current_node, align 4
  %77 = call %class.Tree* @GetRight(%class.Tree* %76)
  store %class.Tree* %77, %class.Tree** %current_node, align 8
  br label %80

; <label>:78                                      ; preds = %72
  br label %79

; <label>:79                                      ; preds = %78
  store i8 0, i8* %cont, align 1
  br label %80

; <label>:80                                      ; preds = %75, %79
  br label %86

; <label>:81                                      ; preds = %64
  br label %82

; <label>:82                                      ; preds = %81
  br label %83

; <label>:83                                      ; preds = %82
  store i32 1, i32* %ifound, align 4
  br label %84

; <label>:84                                      ; preds = %83
  br label %85

; <label>:85                                      ; preds = %84
  store i8 0, i8* %cont, align 1
  br label %86

; <label>:86                                      ; preds = %80, %85
  br label %87

; <label>:87                                      ; preds = %53, %86
  br label %15

; <label>:88                                      ; preds = %20
  %89 = load i32* %ifound, align 4
  ret i32 %89
}

define linkonce_odr i8 @Print(%class.Tree* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %current_node = alloca %class.Tree*
  br label %3

; <label>:3                                       ; preds = %2
  %ntb = alloca i8, align 1
  br label %4

; <label>:4                                       ; preds = %3
  br label %5

; <label>:5                                       ; preds = %4
  %6 = load %class.Tree** %this, align 4
  store %class.Tree* %6, %class.Tree** %current_node, align 8
  br label %7

; <label>:7                                       ; preds = %5
  br label %8

; <label>:8                                       ; preds = %7
  br label %9

; <label>:9                                       ; preds = %8
  %10 = load %class.Tree** %this, align 4
  br label %11

; <label>:11                                      ; preds = %9
  %12 = load %class.Tree** %current_node, align 4
  %13 = call i8 @RecPrint(%class.Tree* %10, %class.Tree* %12)
  store i8 %13, i8* %ntb, align 1
  br label %14

; <label>:14                                      ; preds = %11
  ret i8 1
}

define linkonce_odr i8 @RecPrint(%class.Tree* %arg_this, %class.Tree* %arg_node) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.Tree*
  store %class.Tree* %arg_this, %class.Tree** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %node = alloca %class.Tree*
  store %class.Tree* %arg_node, %class.Tree** %node, align 8
  br label %3

; <label>:3                                       ; preds = %2
  %ntb = alloca i8, align 1
  br label %4

; <label>:4                                       ; preds = %3
  br label %5

; <label>:5                                       ; preds = %4
  br label %6

; <label>:6                                       ; preds = %5
  %7 = load %class.Tree** %node, align 4
  %8 = call i8 @GetHas_Left(%class.Tree* %7)
  %9 = trunc i8 %8 to i1
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  br label %12

; <label>:11                                      ; preds = %6
  br label %22

; <label>:12                                      ; preds = %10
  br label %13

; <label>:13                                      ; preds = %12
  br label %14

; <label>:14                                      ; preds = %13
  br label %15

; <label>:15                                      ; preds = %14
  %16 = load %class.Tree** %this, align 4
  br label %17

; <label>:17                                      ; preds = %15
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load %class.Tree** %node, align 4
  %20 = call %class.Tree* @GetLeft(%class.Tree* %19)
  %21 = call i8 @RecPrint(%class.Tree* %16, %class.Tree* %20)
  store i8 %21, i8* %ntb, align 1
  br label %24

; <label>:22                                      ; preds = %11
  br label %23

; <label>:23                                      ; preds = %22
  store i8 1, i8* %ntb, align 1
  br label %24

; <label>:24                                      ; preds = %18, %23
  br label %25

; <label>:25                                      ; preds = %24
  br label %26

; <label>:26                                      ; preds = %25
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load %class.Tree** %node, align 4
  %29 = call i32 @GetKey(%class.Tree* %28)
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0), i32 %29)
  br label %31

; <label>:31                                      ; preds = %27
  br label %32

; <label>:32                                      ; preds = %31
  br label %33

; <label>:33                                      ; preds = %32
  %34 = load %class.Tree** %node, align 4
  %35 = call i8 @GetHas_Right(%class.Tree* %34)
  %36 = trunc i8 %35 to i1
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %33
  br label %39

; <label>:38                                      ; preds = %33
  br label %49

; <label>:39                                      ; preds = %37
  br label %40

; <label>:40                                      ; preds = %39
  br label %41

; <label>:41                                      ; preds = %40
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load %class.Tree** %this, align 4
  br label %44

; <label>:44                                      ; preds = %42
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load %class.Tree** %node, align 4
  %47 = call %class.Tree* @GetRight(%class.Tree* %46)
  %48 = call i8 @RecPrint(%class.Tree* %43, %class.Tree* %47)
  store i8 %48, i8* %ntb, align 1
  br label %51

; <label>:49                                      ; preds = %38
  br label %50

; <label>:50                                      ; preds = %49
  store i8 1, i8* %ntb, align 1
  br label %51

; <label>:51                                      ; preds = %45, %50
  br label %52

; <label>:52                                      ; preds = %51
  ret i8 1
}

attributes #0 = { nounwind }
