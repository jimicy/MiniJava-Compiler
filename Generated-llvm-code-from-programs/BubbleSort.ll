; ModuleID = 'BubbleSort.ll'

%class.BBS = type { i32*, i32 }

@.str = private constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private constant [4 x i8] c"%d\0A\00", align 1
@.str2 = private constant [4 x i8] c"%d\0A\00", align 1

define void @main() {
entry:
  br label %0

; <label>:0                                       ; preds = %entry
  br label %1

; <label>:1                                       ; preds = %0
  br label %2

; <label>:2                                       ; preds = %1
  %3 = call noalias i8* @_Znwm(i64 ptrtoint (%class.BBS* getelementptr (%class.BBS* null, i32 1) to i64))
  %4 = bitcast i8* %3 to %class.BBS*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 ptrtoint (%class.BBS* getelementptr (%class.BBS* null, i32 1) to i64), i32 8, i1 false)
  br label %5

; <label>:5                                       ; preds = %2
  %6 = call i32 @Start(%class.BBS* %4, i32 10)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 %6)
  ret void
}

declare i32 @printf(i8*, ...)

declare noalias i8* @_Znam(i64)

declare noalias i8* @_Znwm(i64)

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #0

define linkonce_odr i32 @Start(%class.BBS* %arg_this, i32 %arg_sz) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BBS*
  store %class.BBS* %arg_this, %class.BBS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %sz = alloca i32, align 4
  store i32 %arg_sz, i32* %sz, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %aux01 = alloca i32, align 4
  br label %4

; <label>:4                                       ; preds = %3
  br label %5

; <label>:5                                       ; preds = %4
  br label %6

; <label>:6                                       ; preds = %5
  %7 = load %class.BBS** %this, align 4
  br label %8

; <label>:8                                       ; preds = %6
  %9 = load i32* %sz, align 4
  %10 = call i32 @Init(%class.BBS* %7, i32 %9)
  store i32 %10, i32* %aux01, align 4
  br label %11

; <label>:11                                      ; preds = %8
  br label %12

; <label>:12                                      ; preds = %11
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load %class.BBS** %this, align 4
  %15 = call i32 @Print(%class.BBS* %14)
  store i32 %15, i32* %aux01, align 4
  br label %16

; <label>:16                                      ; preds = %13
  br label %17

; <label>:17                                      ; preds = %16
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 99999)
  br label %19

; <label>:19                                      ; preds = %17
  br label %20

; <label>:20                                      ; preds = %19
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load %class.BBS** %this, align 4
  %23 = call i32 @Sort(%class.BBS* %22)
  store i32 %23, i32* %aux01, align 4
  br label %24

; <label>:24                                      ; preds = %21
  br label %25

; <label>:25                                      ; preds = %24
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load %class.BBS** %this, align 4
  %28 = call i32 @Print(%class.BBS* %27)
  store i32 %28, i32* %aux01, align 4
  br label %29

; <label>:29                                      ; preds = %26
  ret i32 0
}

define linkonce_odr i32 @Sort(%class.BBS* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BBS*
  store %class.BBS* %arg_this, %class.BBS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %nt = alloca i32, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %i = alloca i32, align 4
  br label %4

; <label>:4                                       ; preds = %3
  %aux02 = alloca i32, align 4
  br label %5

; <label>:5                                       ; preds = %4
  %aux04 = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  %aux05 = alloca i32, align 4
  br label %7

; <label>:7                                       ; preds = %6
  %aux06 = alloca i32, align 4
  br label %8

; <label>:8                                       ; preds = %7
  %aux07 = alloca i32, align 4
  br label %9

; <label>:9                                       ; preds = %8
  %j = alloca i32, align 4
  br label %10

; <label>:10                                      ; preds = %9
  %t = alloca i32, align 4
  br label %11

; <label>:11                                      ; preds = %10
  br label %12

; <label>:12                                      ; preds = %11
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load %class.BBS** %this
  %15 = getelementptr %class.BBS* %14, i32 0, i32 1
  %16 = load i32* %15, align 4
  br label %17

; <label>:17                                      ; preds = %13
  %18 = sub i32 %16, 1
  store i32 %18, i32* %i, align 4
  br label %19

; <label>:19                                      ; preds = %17
  br label %20

; <label>:20                                      ; preds = %19
  br label %21

; <label>:21                                      ; preds = %20
  br label %22

; <label>:22                                      ; preds = %21
  %23 = sub i32 0, 1
  store i32 %23, i32* %aux02, align 4
  br label %24

; <label>:24                                      ; preds = %22
  br label %25

; <label>:25                                      ; preds = %153, %24
  br label %26

; <label>:26                                      ; preds = %25
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* %aux02, align 4
  br label %29

; <label>:29                                      ; preds = %27
  %30 = load i32* %i, align 4
  %31 = icmp slt i32 %28, %30
  %32 = zext i1 %31 to i8
  %33 = trunc i8 %32 to i1
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %29
  br label %36

; <label>:35                                      ; preds = %29
  br label %155

; <label>:36                                      ; preds = %34
  br label %37

; <label>:37                                      ; preds = %36
  br label %38

; <label>:38                                      ; preds = %37
  store i32 1, i32* %j, align 4
  br label %39

; <label>:39                                      ; preds = %38
  br label %40

; <label>:40                                      ; preds = %147, %39
  br label %41

; <label>:41                                      ; preds = %40
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load i32* %j, align 4
  br label %44

; <label>:44                                      ; preds = %42
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i32* %i, align 4
  br label %47

; <label>:47                                      ; preds = %45
  %48 = add i32 %46, 1
  %49 = icmp slt i32 %43, %48
  %50 = zext i1 %49 to i8
  %51 = trunc i8 %50 to i1
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %47
  br label %54

; <label>:53                                      ; preds = %47
  br label %149

; <label>:54                                      ; preds = %52
  br label %55

; <label>:55                                      ; preds = %54
  br label %56

; <label>:56                                      ; preds = %55
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load i32* %j, align 4
  br label %59

; <label>:59                                      ; preds = %57
  %60 = sub i32 %58, 1
  store i32 %60, i32* %aux07, align 4
  br label %61

; <label>:61                                      ; preds = %59
  br label %62

; <label>:62                                      ; preds = %61
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load %class.BBS** %this
  %65 = getelementptr %class.BBS* %64, i32 0, i32 0
  %66 = load i32** %65, align 4
  br label %67

; <label>:67                                      ; preds = %63
  %68 = load i32* %aux07, align 4
  %69 = add i32 %68, 1
  %70 = getelementptr i32* %66, i32 %69
  %71 = load i32* %70, align 4
  store i32 %71, i32* %aux04, align 4
  br label %72

; <label>:72                                      ; preds = %67
  br label %73

; <label>:73                                      ; preds = %72
  br label %74

; <label>:74                                      ; preds = %73
  %75 = load %class.BBS** %this
  %76 = getelementptr %class.BBS* %75, i32 0, i32 0
  %77 = load i32** %76, align 4
  br label %78

; <label>:78                                      ; preds = %74
  %79 = load i32* %j, align 4
  %80 = add i32 %79, 1
  %81 = getelementptr i32* %77, i32 %80
  %82 = load i32* %81, align 4
  store i32 %82, i32* %aux05, align 4
  br label %83

; <label>:83                                      ; preds = %78
  br label %84

; <label>:84                                      ; preds = %83
  br label %85

; <label>:85                                      ; preds = %84
  %86 = load i32* %aux05, align 4
  br label %87

; <label>:87                                      ; preds = %85
  %88 = load i32* %aux04, align 4
  %89 = icmp slt i32 %86, %88
  %90 = zext i1 %89 to i8
  %91 = trunc i8 %90 to i1
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %87
  br label %94

; <label>:93                                      ; preds = %87
  br label %140

; <label>:94                                      ; preds = %92
  br label %95

; <label>:95                                      ; preds = %94
  br label %96

; <label>:96                                      ; preds = %95
  br label %97

; <label>:97                                      ; preds = %96
  %98 = load i32* %j, align 4
  br label %99

; <label>:99                                      ; preds = %97
  %100 = sub i32 %98, 1
  store i32 %100, i32* %aux06, align 4
  br label %101

; <label>:101                                     ; preds = %99
  br label %102

; <label>:102                                     ; preds = %101
  br label %103

; <label>:103                                     ; preds = %102
  %104 = load %class.BBS** %this
  %105 = getelementptr %class.BBS* %104, i32 0, i32 0
  %106 = load i32** %105, align 4
  br label %107

; <label>:107                                     ; preds = %103
  %108 = load i32* %aux06, align 4
  %109 = add i32 %108, 1
  %110 = getelementptr i32* %106, i32 %109
  %111 = load i32* %110, align 4
  store i32 %111, i32* %t, align 4
  br label %112

; <label>:112                                     ; preds = %107
  br label %113

; <label>:113                                     ; preds = %112
  %114 = load i32* %aux06, align 4
  br label %115

; <label>:115                                     ; preds = %113
  br label %116

; <label>:116                                     ; preds = %115
  %117 = load %class.BBS** %this
  %118 = getelementptr %class.BBS* %117, i32 0, i32 0
  %119 = load i32** %118, align 4
  br label %120

; <label>:120                                     ; preds = %116
  %121 = load i32* %j, align 4
  %122 = add i32 %121, 1
  %123 = getelementptr i32* %119, i32 %122
  %124 = load i32* %123, align 4
  %125 = add i32 %114, 1
  %126 = load %class.BBS** %this
  %127 = getelementptr %class.BBS* %126, i32 0, i32 0
  %128 = load i32** %127, align 8
  %129 = getelementptr i32* %128, i32 %125
  store i32 %124, i32* %129, align 4
  br label %130

; <label>:130                                     ; preds = %120
  br label %131

; <label>:131                                     ; preds = %130
  %132 = load i32* %j, align 4
  br label %133

; <label>:133                                     ; preds = %131
  %134 = load i32* %t, align 4
  %135 = add i32 %132, 1
  %136 = load %class.BBS** %this
  %137 = getelementptr %class.BBS* %136, i32 0, i32 0
  %138 = load i32** %137, align 8
  %139 = getelementptr i32* %138, i32 %135
  store i32 %134, i32* %139, align 4
  br label %142

; <label>:140                                     ; preds = %93
  br label %141

; <label>:141                                     ; preds = %140
  store i32 0, i32* %nt, align 4
  br label %142

; <label>:142                                     ; preds = %133, %141
  br label %143

; <label>:143                                     ; preds = %142
  br label %144

; <label>:144                                     ; preds = %143
  br label %145

; <label>:145                                     ; preds = %144
  %146 = load i32* %j, align 4
  br label %147

; <label>:147                                     ; preds = %145
  %148 = add i32 %146, 1
  store i32 %148, i32* %j, align 4
  br label %40

; <label>:149                                     ; preds = %53
  br label %150

; <label>:150                                     ; preds = %149
  br label %151

; <label>:151                                     ; preds = %150
  %152 = load i32* %i, align 4
  br label %153

; <label>:153                                     ; preds = %151
  %154 = sub i32 %152, 1
  store i32 %154, i32* %i, align 4
  br label %25

; <label>:155                                     ; preds = %35
  ret i32 0
}

define linkonce_odr i32 @Print(%class.BBS* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BBS*
  store %class.BBS* %arg_this, %class.BBS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %j = alloca i32, align 4
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  store i32 0, i32* %j, align 4
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
  %11 = load %class.BBS** %this
  %12 = getelementptr %class.BBS* %11, i32 0, i32 1
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
  %23 = load %class.BBS** %this
  %24 = getelementptr %class.BBS* %23, i32 0, i32 0
  %25 = load i32** %24, align 4
  br label %26

; <label>:26                                      ; preds = %22
  %27 = load i32* %j, align 4
  %28 = add i32 %27, 1
  %29 = getelementptr i32* %25, i32 %28
  %30 = load i32* %29, align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %30)
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

define linkonce_odr i32 @Init(%class.BBS* %arg_this, i32 %arg_sz) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BBS*
  store %class.BBS* %arg_this, %class.BBS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %sz = alloca i32, align 4
  store i32 %arg_sz, i32* %sz, align 4
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  %5 = load i32* %sz, align 4
  %6 = load %class.BBS** %this
  %7 = getelementptr %class.BBS* %6, i32 0, i32 1
  store i32 %5, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %8
  br label %10

; <label>:10                                      ; preds = %9
  %11 = load i32* %sz, align 4
  %12 = add i32 %11, 1
  %13 = mul i32 %12, 4
  %14 = sext i32 %13 to i64
  %15 = call noalias i8* @_Znam(i64 %14)
  %newint = bitcast i8* %15 to i32*
  %16 = getelementptr i32* %newint, i32 0
  store i32 %11, i32* %16, align 4
  %17 = load %class.BBS** %this
  %18 = getelementptr %class.BBS* %17, i32 0, i32 0
  store i32* %newint, i32** %18, align 8
  br label %19

; <label>:19                                      ; preds = %10
  br label %20

; <label>:20                                      ; preds = %19
  br label %21

; <label>:21                                      ; preds = %20
  %22 = add i32 0, 1
  %23 = load %class.BBS** %this
  %24 = getelementptr %class.BBS* %23, i32 0, i32 0
  %25 = load i32** %24, align 8
  %26 = getelementptr i32* %25, i32 %22
  store i32 20, i32* %26, align 4
  br label %27

; <label>:27                                      ; preds = %21
  br label %28

; <label>:28                                      ; preds = %27
  br label %29

; <label>:29                                      ; preds = %28
  %30 = add i32 1, 1
  %31 = load %class.BBS** %this
  %32 = getelementptr %class.BBS* %31, i32 0, i32 0
  %33 = load i32** %32, align 8
  %34 = getelementptr i32* %33, i32 %30
  store i32 7, i32* %34, align 4
  br label %35

; <label>:35                                      ; preds = %29
  br label %36

; <label>:36                                      ; preds = %35
  br label %37

; <label>:37                                      ; preds = %36
  %38 = add i32 2, 1
  %39 = load %class.BBS** %this
  %40 = getelementptr %class.BBS* %39, i32 0, i32 0
  %41 = load i32** %40, align 8
  %42 = getelementptr i32* %41, i32 %38
  store i32 12, i32* %42, align 4
  br label %43

; <label>:43                                      ; preds = %37
  br label %44

; <label>:44                                      ; preds = %43
  br label %45

; <label>:45                                      ; preds = %44
  %46 = add i32 3, 1
  %47 = load %class.BBS** %this
  %48 = getelementptr %class.BBS* %47, i32 0, i32 0
  %49 = load i32** %48, align 8
  %50 = getelementptr i32* %49, i32 %46
  store i32 18, i32* %50, align 4
  br label %51

; <label>:51                                      ; preds = %45
  br label %52

; <label>:52                                      ; preds = %51
  br label %53

; <label>:53                                      ; preds = %52
  %54 = add i32 4, 1
  %55 = load %class.BBS** %this
  %56 = getelementptr %class.BBS* %55, i32 0, i32 0
  %57 = load i32** %56, align 8
  %58 = getelementptr i32* %57, i32 %54
  store i32 2, i32* %58, align 4
  br label %59

; <label>:59                                      ; preds = %53
  br label %60

; <label>:60                                      ; preds = %59
  br label %61

; <label>:61                                      ; preds = %60
  %62 = add i32 5, 1
  %63 = load %class.BBS** %this
  %64 = getelementptr %class.BBS* %63, i32 0, i32 0
  %65 = load i32** %64, align 8
  %66 = getelementptr i32* %65, i32 %62
  store i32 11, i32* %66, align 4
  br label %67

; <label>:67                                      ; preds = %61
  br label %68

; <label>:68                                      ; preds = %67
  br label %69

; <label>:69                                      ; preds = %68
  %70 = add i32 6, 1
  %71 = load %class.BBS** %this
  %72 = getelementptr %class.BBS* %71, i32 0, i32 0
  %73 = load i32** %72, align 8
  %74 = getelementptr i32* %73, i32 %70
  store i32 6, i32* %74, align 4
  br label %75

; <label>:75                                      ; preds = %69
  br label %76

; <label>:76                                      ; preds = %75
  br label %77

; <label>:77                                      ; preds = %76
  %78 = add i32 7, 1
  %79 = load %class.BBS** %this
  %80 = getelementptr %class.BBS* %79, i32 0, i32 0
  %81 = load i32** %80, align 8
  %82 = getelementptr i32* %81, i32 %78
  store i32 9, i32* %82, align 4
  br label %83

; <label>:83                                      ; preds = %77
  br label %84

; <label>:84                                      ; preds = %83
  br label %85

; <label>:85                                      ; preds = %84
  %86 = add i32 8, 1
  %87 = load %class.BBS** %this
  %88 = getelementptr %class.BBS* %87, i32 0, i32 0
  %89 = load i32** %88, align 8
  %90 = getelementptr i32* %89, i32 %86
  store i32 19, i32* %90, align 4
  br label %91

; <label>:91                                      ; preds = %85
  br label %92

; <label>:92                                      ; preds = %91
  br label %93

; <label>:93                                      ; preds = %92
  %94 = add i32 9, 1
  %95 = load %class.BBS** %this
  %96 = getelementptr %class.BBS* %95, i32 0, i32 0
  %97 = load i32** %96, align 8
  %98 = getelementptr i32* %97, i32 %94
  store i32 5, i32* %98, align 4
  br label %99

; <label>:99                                      ; preds = %93
  ret i32 0
}

attributes #0 = { nounwind }
