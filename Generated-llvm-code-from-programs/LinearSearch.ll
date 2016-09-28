; ModuleID = 'LinearSearch.ll'

%class.LS = type { i32*, i32 }

@.str = private constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private constant [4 x i8] c"%d\0A\00", align 1
@.str2 = private constant [4 x i8] c"%d\0A\00", align 1
@.str3 = private constant [4 x i8] c"%d\0A\00", align 1
@.str4 = private constant [4 x i8] c"%d\0A\00", align 1
@.str5 = private constant [4 x i8] c"%d\0A\00", align 1
@.str6 = private constant [4 x i8] c"%d\0A\00", align 1

define void @main() {
entry:
  br label %0

; <label>:0                                       ; preds = %entry
  br label %1

; <label>:1                                       ; preds = %0
  br label %2

; <label>:2                                       ; preds = %1
  %3 = call noalias i8* @_Znwm(i64 ptrtoint (%class.LS* getelementptr (%class.LS* null, i32 1) to i64))
  %4 = bitcast i8* %3 to %class.LS*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 ptrtoint (%class.LS* getelementptr (%class.LS* null, i32 1) to i64), i32 8, i1 false)
  br label %5

; <label>:5                                       ; preds = %2
  %6 = call i32 @Start(%class.LS* %4, i32 10)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 %6)
  ret void
}

declare i32 @printf(i8*, ...)

declare noalias i8* @_Znam(i64)

declare noalias i8* @_Znwm(i64)

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #0

define linkonce_odr i32 @Start(%class.LS* %arg_this, i32 %arg_sz) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.LS*
  store %class.LS* %arg_this, %class.LS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %sz = alloca i32, align 4
  store i32 %arg_sz, i32* %sz, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %aux01 = alloca i32, align 4
  br label %4

; <label>:4                                       ; preds = %3
  %aux02 = alloca i32, align 4
  br label %5

; <label>:5                                       ; preds = %4
  br label %6

; <label>:6                                       ; preds = %5
  br label %7

; <label>:7                                       ; preds = %6
  %8 = load %class.LS** %this, align 4
  br label %9

; <label>:9                                       ; preds = %7
  %10 = load i32* %sz, align 4
  %11 = call i32 @Init(%class.LS* %8, i32 %10)
  store i32 %11, i32* %aux01, align 4
  br label %12

; <label>:12                                      ; preds = %9
  br label %13

; <label>:13                                      ; preds = %12
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load %class.LS** %this, align 4
  %16 = call i32 @Print(%class.LS* %15)
  store i32 %16, i32* %aux02, align 4
  br label %17

; <label>:17                                      ; preds = %14
  br label %18

; <label>:18                                      ; preds = %17
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 9999)
  br label %20

; <label>:20                                      ; preds = %18
  br label %21

; <label>:21                                      ; preds = %20
  br label %22

; <label>:22                                      ; preds = %21
  %23 = load %class.LS** %this, align 4
  br label %24

; <label>:24                                      ; preds = %22
  %25 = call i32 @Search(%class.LS* %23, i32 8)
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %25)
  br label %27

; <label>:27                                      ; preds = %24
  br label %28

; <label>:28                                      ; preds = %27
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load %class.LS** %this, align 4
  br label %31

; <label>:31                                      ; preds = %29
  %32 = call i32 @Search(%class.LS* %30, i32 12)
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 %32)
  br label %34

; <label>:34                                      ; preds = %31
  br label %35

; <label>:35                                      ; preds = %34
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load %class.LS** %this, align 4
  br label %38

; <label>:38                                      ; preds = %36
  %39 = call i32 @Search(%class.LS* %37, i32 17)
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %39)
  br label %41

; <label>:41                                      ; preds = %38
  br label %42

; <label>:42                                      ; preds = %41
  br label %43

; <label>:43                                      ; preds = %42
  %44 = load %class.LS** %this, align 4
  br label %45

; <label>:45                                      ; preds = %43
  %46 = call i32 @Search(%class.LS* %44, i32 50)
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %46)
  br label %48

; <label>:48                                      ; preds = %45
  ret i32 55
}

define linkonce_odr i32 @Print(%class.LS* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.LS*
  store %class.LS* %arg_this, %class.LS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %j = alloca i32, align 4
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  store i32 1, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %4
  br label %6

; <label>:6                                       ; preds = %36, %5
  br label %7

; <label>:7                                       ; preds = %6
  br label %8

; <label>:8                                       ; preds = %7
  %9 = load i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %8
  %11 = load %class.LS** %this
  %12 = getelementptr %class.LS* %11, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = icmp slt i32 %9, %13
  %15 = zext i1 %14 to i8
  %16 = trunc i8 %15 to i1
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %10
  br label %19

; <label>:18                                      ; preds = %10
  br label %38

; <label>:19                                      ; preds = %17
  br label %20

; <label>:20                                      ; preds = %19
  br label %21

; <label>:21                                      ; preds = %20
  br label %22

; <label>:22                                      ; preds = %21
  %23 = load %class.LS** %this
  %24 = getelementptr %class.LS* %23, i32 0, i32 0
  %25 = load i32** %24, align 4
  br label %26

; <label>:26                                      ; preds = %22
  %27 = load i32* %j, align 4
  %28 = add i32 %27, 1
  %29 = getelementptr i32* %25, i32 %28
  %30 = load i32* %29, align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i32 %30)
  br label %32

; <label>:32                                      ; preds = %26
  br label %33

; <label>:33                                      ; preds = %32
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %j, align 4
  br label %36

; <label>:36                                      ; preds = %34
  %37 = add i32 %35, 1
  store i32 %37, i32* %j, align 4
  br label %6

; <label>:38                                      ; preds = %18
  ret i32 0
}

define linkonce_odr i32 @Search(%class.LS* %arg_this, i32 %arg_num) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.LS*
  store %class.LS* %arg_this, %class.LS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %num = alloca i32, align 4
  store i32 %arg_num, i32* %num, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %j = alloca i32, align 4
  br label %4

; <label>:4                                       ; preds = %3
  %ls01 = alloca i8, align 1
  br label %5

; <label>:5                                       ; preds = %4
  %ifound = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  %aux01 = alloca i32, align 4
  br label %7

; <label>:7                                       ; preds = %6
  %aux02 = alloca i32, align 4
  br label %8

; <label>:8                                       ; preds = %7
  %nt = alloca i32, align 4
  br label %9

; <label>:9                                       ; preds = %8
  br label %10

; <label>:10                                      ; preds = %9
  store i32 1, i32* %j, align 4
  br label %11

; <label>:11                                      ; preds = %10
  br label %12

; <label>:12                                      ; preds = %11
  store i8 0, i8* %ls01, align 1
  br label %13

; <label>:13                                      ; preds = %12
  br label %14

; <label>:14                                      ; preds = %13
  store i32 0, i32* %ifound, align 4
  br label %15

; <label>:15                                      ; preds = %14
  br label %16

; <label>:16                                      ; preds = %93, %15
  br label %17

; <label>:17                                      ; preds = %16
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i32* %j, align 4
  br label %20

; <label>:20                                      ; preds = %18
  %21 = load %class.LS** %this
  %22 = getelementptr %class.LS* %21, i32 0, i32 1
  %23 = load i32* %22, align 4
  %24 = icmp slt i32 %19, %23
  %25 = zext i1 %24 to i8
  %26 = trunc i8 %25 to i1
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %20
  br label %29

; <label>:28                                      ; preds = %20
  br label %95

; <label>:29                                      ; preds = %27
  br label %30

; <label>:30                                      ; preds = %29
  br label %31

; <label>:31                                      ; preds = %30
  br label %32

; <label>:32                                      ; preds = %31
  %33 = load %class.LS** %this
  %34 = getelementptr %class.LS* %33, i32 0, i32 0
  %35 = load i32** %34, align 4
  br label %36

; <label>:36                                      ; preds = %32
  %37 = load i32* %j, align 4
  %38 = add i32 %37, 1
  %39 = getelementptr i32* %35, i32 %38
  %40 = load i32* %39, align 4
  store i32 %40, i32* %aux01, align 4
  br label %41

; <label>:41                                      ; preds = %36
  br label %42

; <label>:42                                      ; preds = %41
  br label %43

; <label>:43                                      ; preds = %42
  %44 = load i32* %num, align 4
  br label %45

; <label>:45                                      ; preds = %43
  %46 = add i32 %44, 1
  store i32 %46, i32* %aux02, align 4
  br label %47

; <label>:47                                      ; preds = %45
  br label %48

; <label>:48                                      ; preds = %47
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i32* %aux01, align 4
  br label %51

; <label>:51                                      ; preds = %49
  %52 = load i32* %num, align 4
  %53 = icmp slt i32 %50, %52
  %54 = zext i1 %53 to i8
  %55 = trunc i8 %54 to i1
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %51
  br label %58

; <label>:57                                      ; preds = %51
  br label %60

; <label>:58                                      ; preds = %56
  br label %59

; <label>:59                                      ; preds = %58
  store i32 0, i32* %nt, align 4
  br label %88

; <label>:60                                      ; preds = %57
  br label %61

; <label>:61                                      ; preds = %60
  br label %62

; <label>:62                                      ; preds = %61
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load i32* %aux01, align 4
  br label %65

; <label>:65                                      ; preds = %63
  %66 = load i32* %aux02, align 4
  %67 = icmp slt i32 %64, %66
  %68 = zext i1 %67 to i8
  %69 = trunc i8 %68 to i1
  %70 = xor i1 %69, true
  %71 = zext i1 %70 to i8
  %72 = trunc i8 %71 to i1
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %65
  br label %75

; <label>:74                                      ; preds = %65
  br label %77

; <label>:75                                      ; preds = %73
  br label %76

; <label>:76                                      ; preds = %75
  store i32 0, i32* %nt, align 4
  br label %87

; <label>:77                                      ; preds = %74
  br label %78

; <label>:78                                      ; preds = %77
  br label %79

; <label>:79                                      ; preds = %78
  store i8 1, i8* %ls01, align 1
  br label %80

; <label>:80                                      ; preds = %79
  br label %81

; <label>:81                                      ; preds = %80
  store i32 1, i32* %ifound, align 4
  br label %82

; <label>:82                                      ; preds = %81
  br label %83

; <label>:83                                      ; preds = %82
  %84 = load %class.LS** %this
  %85 = getelementptr %class.LS* %84, i32 0, i32 1
  %86 = load i32* %85, align 4
  store i32 %86, i32* %j, align 4
  br label %87

; <label>:87                                      ; preds = %76, %83
  br label %88

; <label>:88                                      ; preds = %59, %87
  br label %89

; <label>:89                                      ; preds = %88
  br label %90

; <label>:90                                      ; preds = %89
  br label %91

; <label>:91                                      ; preds = %90
  %92 = load i32* %j, align 4
  br label %93

; <label>:93                                      ; preds = %91
  %94 = add i32 %92, 1
  store i32 %94, i32* %j, align 4
  br label %16

; <label>:95                                      ; preds = %28
  %96 = load i32* %ifound, align 4
  ret i32 %96
}

define linkonce_odr i32 @Init(%class.LS* %arg_this, i32 %arg_sz) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.LS*
  store %class.LS* %arg_this, %class.LS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %sz = alloca i32, align 4
  store i32 %arg_sz, i32* %sz, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %j = alloca i32, align 4
  br label %4

; <label>:4                                       ; preds = %3
  %k = alloca i32, align 4
  br label %5

; <label>:5                                       ; preds = %4
  %aux01 = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  %aux02 = alloca i32, align 4
  br label %7

; <label>:7                                       ; preds = %6
  br label %8

; <label>:8                                       ; preds = %7
  %9 = load i32* %sz, align 4
  %10 = load %class.LS** %this
  %11 = getelementptr %class.LS* %10, i32 0, i32 1
  store i32 %9, i32* %11, align 4
  br label %12

; <label>:12                                      ; preds = %8
  br label %13

; <label>:13                                      ; preds = %12
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load i32* %sz, align 4
  %16 = add i32 %15, 1
  %17 = mul i32 %16, 4
  %18 = sext i32 %17 to i64
  %19 = call noalias i8* @_Znam(i64 %18)
  %newint = bitcast i8* %19 to i32*
  %20 = getelementptr i32* %newint, i32 0
  store i32 %15, i32* %20, align 4
  %21 = load %class.LS** %this
  %22 = getelementptr %class.LS* %21, i32 0, i32 0
  store i32* %newint, i32** %22, align 8
  br label %23

; <label>:23                                      ; preds = %14
  br label %24

; <label>:24                                      ; preds = %23
  store i32 1, i32* %j, align 4
  br label %25

; <label>:25                                      ; preds = %24
  br label %26

; <label>:26                                      ; preds = %25
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load %class.LS** %this
  %29 = getelementptr %class.LS* %28, i32 0, i32 1
  %30 = load i32* %29, align 4
  br label %31

; <label>:31                                      ; preds = %27
  %32 = add i32 %30, 1
  store i32 %32, i32* %k, align 4
  br label %33

; <label>:33                                      ; preds = %31
  br label %34

; <label>:34                                      ; preds = %84, %33
  br label %35

; <label>:35                                      ; preds = %34
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32* %j, align 4
  br label %38

; <label>:38                                      ; preds = %36
  %39 = load %class.LS** %this
  %40 = getelementptr %class.LS* %39, i32 0, i32 1
  %41 = load i32* %40, align 4
  %42 = icmp slt i32 %37, %41
  %43 = zext i1 %42 to i8
  %44 = trunc i8 %43 to i1
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %38
  br label %47

; <label>:46                                      ; preds = %38
  br label %86

; <label>:47                                      ; preds = %45
  br label %48

; <label>:48                                      ; preds = %47
  br label %49

; <label>:49                                      ; preds = %48
  br label %50

; <label>:50                                      ; preds = %49
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load i32* %j, align 4
  %53 = mul i32 2, %52
  store i32 %53, i32* %aux01, align 4
  br label %54

; <label>:54                                      ; preds = %51
  br label %55

; <label>:55                                      ; preds = %54
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load i32* %k, align 4
  br label %58

; <label>:58                                      ; preds = %56
  %59 = sub i32 %57, 3
  store i32 %59, i32* %aux02, align 4
  br label %60

; <label>:60                                      ; preds = %58
  br label %61

; <label>:61                                      ; preds = %60
  %62 = load i32* %j, align 4
  br label %63

; <label>:63                                      ; preds = %61
  br label %64

; <label>:64                                      ; preds = %63
  %65 = load i32* %aux01, align 4
  br label %66

; <label>:66                                      ; preds = %64
  %67 = load i32* %aux02, align 4
  %68 = add i32 %65, %67
  %69 = add i32 %62, 1
  %70 = load %class.LS** %this
  %71 = getelementptr %class.LS* %70, i32 0, i32 0
  %72 = load i32** %71, align 8
  %73 = getelementptr i32* %72, i32 %69
  store i32 %68, i32* %73, align 4
  br label %74

; <label>:74                                      ; preds = %66
  br label %75

; <label>:75                                      ; preds = %74
  br label %76

; <label>:76                                      ; preds = %75
  %77 = load i32* %j, align 4
  br label %78

; <label>:78                                      ; preds = %76
  %79 = add i32 %77, 1
  store i32 %79, i32* %j, align 4
  br label %80

; <label>:80                                      ; preds = %78
  br label %81

; <label>:81                                      ; preds = %80
  br label %82

; <label>:82                                      ; preds = %81
  %83 = load i32* %k, align 4
  br label %84

; <label>:84                                      ; preds = %82
  %85 = sub i32 %83, 1
  store i32 %85, i32* %k, align 4
  br label %34

; <label>:86                                      ; preds = %46
  ret i32 0
}

attributes #0 = { nounwind }
