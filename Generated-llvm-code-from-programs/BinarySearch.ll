; ModuleID = 'BinarySearch.ll'

%class.BS = type { i32*, i32 }

@.str = private constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private constant [4 x i8] c"%d\0A\00", align 1
@.str2 = private constant [4 x i8] c"%d\0A\00", align 1
@.str3 = private constant [4 x i8] c"%d\0A\00", align 1
@.str4 = private constant [4 x i8] c"%d\0A\00", align 1
@.str5 = private constant [4 x i8] c"%d\0A\00", align 1
@.str6 = private constant [4 x i8] c"%d\0A\00", align 1
@.str7 = private constant [4 x i8] c"%d\0A\00", align 1
@.str8 = private constant [4 x i8] c"%d\0A\00", align 1
@.str9 = private constant [4 x i8] c"%d\0A\00", align 1
@.str10 = private constant [4 x i8] c"%d\0A\00", align 1
@.str11 = private constant [4 x i8] c"%d\0A\00", align 1
@.str12 = private constant [4 x i8] c"%d\0A\00", align 1
@.str13 = private constant [4 x i8] c"%d\0A\00", align 1
@.str14 = private constant [4 x i8] c"%d\0A\00", align 1
@.str15 = private constant [4 x i8] c"%d\0A\00", align 1
@.str16 = private constant [4 x i8] c"%d\0A\00", align 1
@.str17 = private constant [4 x i8] c"%d\0A\00", align 1
@.str18 = private constant [4 x i8] c"%d\0A\00", align 1

define void @main() {
entry:
  br label %0

; <label>:0                                       ; preds = %entry
  br label %1

; <label>:1                                       ; preds = %0
  br label %2

; <label>:2                                       ; preds = %1
  %3 = call noalias i8* @_Znwm(i64 ptrtoint (%class.BS* getelementptr (%class.BS* null, i32 1) to i64))
  %4 = bitcast i8* %3 to %class.BS*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 ptrtoint (%class.BS* getelementptr (%class.BS* null, i32 1) to i64), i32 8, i1 false)
  br label %5

; <label>:5                                       ; preds = %2
  %6 = call i32 @Start(%class.BS* %4, i32 20)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i32 %6)
  ret void
}

declare i32 @printf(i8*, ...)

declare noalias i8* @_Znam(i64)

declare noalias i8* @_Znwm(i64)

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #0

define linkonce_odr i32 @Start(%class.BS* %arg_this, i32 %arg_sz) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BS*
  store %class.BS* %arg_this, %class.BS** %this, align 8
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
  %8 = load %class.BS** %this, align 4
  br label %9

; <label>:9                                       ; preds = %7
  %10 = load i32* %sz, align 4
  %11 = call i32 @Init(%class.BS* %8, i32 %10)
  store i32 %11, i32* %aux01, align 4
  br label %12

; <label>:12                                      ; preds = %9
  br label %13

; <label>:13                                      ; preds = %12
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load %class.BS** %this, align 4
  %16 = call i32 @Print(%class.BS* %15)
  store i32 %16, i32* %aux02, align 4
  br label %17

; <label>:17                                      ; preds = %14
  br label %18

; <label>:18                                      ; preds = %17
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load %class.BS** %this, align 4
  br label %21

; <label>:21                                      ; preds = %19
  %22 = call i8 @Search(%class.BS* %20, i32 8)
  %23 = trunc i8 %22 to i1
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  br label %26

; <label>:25                                      ; preds = %21
  br label %29

; <label>:26                                      ; preds = %24
  br label %27

; <label>:27                                      ; preds = %26
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 1)
  br label %32

; <label>:29                                      ; preds = %25
  br label %30

; <label>:30                                      ; preds = %29
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 0)
  br label %32

; <label>:32                                      ; preds = %27, %30
  br label %33

; <label>:33                                      ; preds = %32
  br label %34

; <label>:34                                      ; preds = %33
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load %class.BS** %this, align 4
  br label %37

; <label>:37                                      ; preds = %35
  %38 = call i8 @Search(%class.BS* %36, i32 19)
  %39 = trunc i8 %38 to i1
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  br label %42

; <label>:41                                      ; preds = %37
  br label %45

; <label>:42                                      ; preds = %40
  br label %43

; <label>:43                                      ; preds = %42
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 1)
  br label %48

; <label>:45                                      ; preds = %41
  br label %46

; <label>:46                                      ; preds = %45
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 0)
  br label %48

; <label>:48                                      ; preds = %43, %46
  br label %49

; <label>:49                                      ; preds = %48
  br label %50

; <label>:50                                      ; preds = %49
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load %class.BS** %this, align 4
  br label %53

; <label>:53                                      ; preds = %51
  %54 = call i8 @Search(%class.BS* %52, i32 20)
  %55 = trunc i8 %54 to i1
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %53
  br label %58

; <label>:57                                      ; preds = %53
  br label %61

; <label>:58                                      ; preds = %56
  br label %59

; <label>:59                                      ; preds = %58
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 1)
  br label %64

; <label>:61                                      ; preds = %57
  br label %62

; <label>:62                                      ; preds = %61
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i32 0)
  br label %64

; <label>:64                                      ; preds = %59, %62
  br label %65

; <label>:65                                      ; preds = %64
  br label %66

; <label>:66                                      ; preds = %65
  br label %67

; <label>:67                                      ; preds = %66
  %68 = load %class.BS** %this, align 4
  br label %69

; <label>:69                                      ; preds = %67
  %70 = call i8 @Search(%class.BS* %68, i32 21)
  %71 = trunc i8 %70 to i1
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %69
  br label %74

; <label>:73                                      ; preds = %69
  br label %77

; <label>:74                                      ; preds = %72
  br label %75

; <label>:75                                      ; preds = %74
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 1)
  br label %80

; <label>:77                                      ; preds = %73
  br label %78

; <label>:78                                      ; preds = %77
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0), i32 0)
  br label %80

; <label>:80                                      ; preds = %75, %78
  br label %81

; <label>:81                                      ; preds = %80
  br label %82

; <label>:82                                      ; preds = %81
  br label %83

; <label>:83                                      ; preds = %82
  %84 = load %class.BS** %this, align 4
  br label %85

; <label>:85                                      ; preds = %83
  %86 = call i8 @Search(%class.BS* %84, i32 37)
  %87 = trunc i8 %86 to i1
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %85
  br label %90

; <label>:89                                      ; preds = %85
  br label %93

; <label>:90                                      ; preds = %88
  br label %91

; <label>:91                                      ; preds = %90
  %92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str8, i32 0, i32 0), i32 1)
  br label %96

; <label>:93                                      ; preds = %89
  br label %94

; <label>:94                                      ; preds = %93
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i32 0)
  br label %96

; <label>:96                                      ; preds = %91, %94
  br label %97

; <label>:97                                      ; preds = %96
  br label %98

; <label>:98                                      ; preds = %97
  br label %99

; <label>:99                                      ; preds = %98
  %100 = load %class.BS** %this, align 4
  br label %101

; <label>:101                                     ; preds = %99
  %102 = call i8 @Search(%class.BS* %100, i32 38)
  %103 = trunc i8 %102 to i1
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %101
  br label %106

; <label>:105                                     ; preds = %101
  br label %109

; <label>:106                                     ; preds = %104
  br label %107

; <label>:107                                     ; preds = %106
  %108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0), i32 1)
  br label %112

; <label>:109                                     ; preds = %105
  br label %110

; <label>:110                                     ; preds = %109
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 0)
  br label %112

; <label>:112                                     ; preds = %107, %110
  br label %113

; <label>:113                                     ; preds = %112
  br label %114

; <label>:114                                     ; preds = %113
  br label %115

; <label>:115                                     ; preds = %114
  %116 = load %class.BS** %this, align 4
  br label %117

; <label>:117                                     ; preds = %115
  %118 = call i8 @Search(%class.BS* %116, i32 39)
  %119 = trunc i8 %118 to i1
  br i1 %119, label %120, label %121

; <label>:120                                     ; preds = %117
  br label %122

; <label>:121                                     ; preds = %117
  br label %125

; <label>:122                                     ; preds = %120
  br label %123

; <label>:123                                     ; preds = %122
  %124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 1)
  br label %128

; <label>:125                                     ; preds = %121
  br label %126

; <label>:126                                     ; preds = %125
  %127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str13, i32 0, i32 0), i32 0)
  br label %128

; <label>:128                                     ; preds = %123, %126
  br label %129

; <label>:129                                     ; preds = %128
  br label %130

; <label>:130                                     ; preds = %129
  br label %131

; <label>:131                                     ; preds = %130
  %132 = load %class.BS** %this, align 4
  br label %133

; <label>:133                                     ; preds = %131
  %134 = call i8 @Search(%class.BS* %132, i32 50)
  %135 = trunc i8 %134 to i1
  br i1 %135, label %136, label %137

; <label>:136                                     ; preds = %133
  br label %138

; <label>:137                                     ; preds = %133
  br label %141

; <label>:138                                     ; preds = %136
  br label %139

; <label>:139                                     ; preds = %138
  %140 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str14, i32 0, i32 0), i32 1)
  br label %144

; <label>:141                                     ; preds = %137
  br label %142

; <label>:142                                     ; preds = %141
  %143 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str15, i32 0, i32 0), i32 0)
  br label %144

; <label>:144                                     ; preds = %139, %142
  br label %145

; <label>:145                                     ; preds = %144
  ret i32 999
}

define linkonce_odr i8 @Search(%class.BS* %arg_this, i32 %arg_num) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BS*
  store %class.BS* %arg_this, %class.BS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %num = alloca i32, align 4
  store i32 %arg_num, i32* %num, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %bs01 = alloca i8, align 1
  br label %4

; <label>:4                                       ; preds = %3
  %right = alloca i32, align 4
  br label %5

; <label>:5                                       ; preds = %4
  %left = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  %var_cont = alloca i8, align 1
  br label %7

; <label>:7                                       ; preds = %6
  %medium = alloca i32, align 4
  br label %8

; <label>:8                                       ; preds = %7
  %aux01 = alloca i32, align 4
  br label %9

; <label>:9                                       ; preds = %8
  %nt = alloca i32, align 4
  br label %10

; <label>:10                                      ; preds = %9
  br label %11

; <label>:11                                      ; preds = %10
  store i32 0, i32* %aux01, align 4
  br label %12

; <label>:12                                      ; preds = %11
  br label %13

; <label>:13                                      ; preds = %12
  store i8 0, i8* %bs01, align 1
  br label %14

; <label>:14                                      ; preds = %13
  br label %15

; <label>:15                                      ; preds = %14
  br label %16

; <label>:16                                      ; preds = %15
  %17 = load %class.BS** %this
  %18 = getelementptr %class.BS* %17, i32 0, i32 0
  %19 = load i32** %18, align 4
  %20 = getelementptr i32* %19, i32 0
  %21 = load i32* %20, align 4
  store i32 %21, i32* %right, align 4
  br label %22

; <label>:22                                      ; preds = %16
  br label %23

; <label>:23                                      ; preds = %22
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32* %right, align 4
  br label %26

; <label>:26                                      ; preds = %24
  %27 = sub i32 %25, 1
  store i32 %27, i32* %right, align 4
  br label %28

; <label>:28                                      ; preds = %26
  br label %29

; <label>:29                                      ; preds = %28
  store i32 0, i32* %left, align 4
  br label %30

; <label>:30                                      ; preds = %29
  br label %31

; <label>:31                                      ; preds = %30
  store i8 1, i8* %var_cont, align 1
  br label %32

; <label>:32                                      ; preds = %31
  br label %33

; <label>:33                                      ; preds = %121, %32
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i8* %var_cont, align 4
  %36 = trunc i8 %35 to i1
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %34
  br label %39

; <label>:38                                      ; preds = %34
  br label %122

; <label>:39                                      ; preds = %37
  br label %40

; <label>:40                                      ; preds = %39
  br label %41

; <label>:41                                      ; preds = %40
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load i32* %left, align 4
  br label %44

; <label>:44                                      ; preds = %42
  %45 = load i32* %right, align 4
  %46 = add i32 %43, %45
  store i32 %46, i32* %medium, align 4
  br label %47

; <label>:47                                      ; preds = %44
  br label %48

; <label>:48                                      ; preds = %47
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load %class.BS** %this, align 4
  br label %51

; <label>:51                                      ; preds = %49
  %52 = load i32* %medium, align 4
  %53 = call i32 @Div(%class.BS* %50, i32 %52)
  store i32 %53, i32* %medium, align 4
  br label %54

; <label>:54                                      ; preds = %51
  br label %55

; <label>:55                                      ; preds = %54
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load %class.BS** %this
  %58 = getelementptr %class.BS* %57, i32 0, i32 0
  %59 = load i32** %58, align 4
  br label %60

; <label>:60                                      ; preds = %56
  %61 = load i32* %medium, align 4
  %62 = add i32 %61, 1
  %63 = getelementptr i32* %59, i32 %62
  %64 = load i32* %63, align 4
  store i32 %64, i32* %aux01, align 4
  br label %65

; <label>:65                                      ; preds = %60
  br label %66

; <label>:66                                      ; preds = %65
  br label %67

; <label>:67                                      ; preds = %66
  %68 = load i32* %num, align 4
  br label %69

; <label>:69                                      ; preds = %67
  %70 = load i32* %aux01, align 4
  %71 = icmp slt i32 %68, %70
  %72 = zext i1 %71 to i8
  %73 = trunc i8 %72 to i1
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %69
  br label %76

; <label>:75                                      ; preds = %69
  br label %82

; <label>:76                                      ; preds = %74
  br label %77

; <label>:77                                      ; preds = %76
  br label %78

; <label>:78                                      ; preds = %77
  %79 = load i32* %medium, align 4
  br label %80

; <label>:80                                      ; preds = %78
  %81 = sub i32 %79, 1
  store i32 %81, i32* %right, align 4
  br label %88

; <label>:82                                      ; preds = %75
  br label %83

; <label>:83                                      ; preds = %82
  br label %84

; <label>:84                                      ; preds = %83
  %85 = load i32* %medium, align 4
  br label %86

; <label>:86                                      ; preds = %84
  %87 = add i32 %85, 1
  store i32 %87, i32* %left, align 4
  br label %88

; <label>:88                                      ; preds = %80, %86
  br label %89

; <label>:89                                      ; preds = %88
  br label %90

; <label>:90                                      ; preds = %89
  br label %91

; <label>:91                                      ; preds = %90
  %92 = load %class.BS** %this, align 4
  br label %93

; <label>:93                                      ; preds = %91
  %94 = load i32* %aux01, align 4
  br label %95

; <label>:95                                      ; preds = %93
  %96 = load i32* %num, align 4
  %97 = call i8 @Compare(%class.BS* %92, i32 %94, i32 %96)
  %98 = trunc i8 %97 to i1
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %95
  br label %101

; <label>:100                                     ; preds = %95
  br label %103

; <label>:101                                     ; preds = %99
  br label %102

; <label>:102                                     ; preds = %101
  store i8 0, i8* %var_cont, align 1
  br label %105

; <label>:103                                     ; preds = %100
  br label %104

; <label>:104                                     ; preds = %103
  store i8 1, i8* %var_cont, align 1
  br label %105

; <label>:105                                     ; preds = %102, %104
  br label %106

; <label>:106                                     ; preds = %105
  br label %107

; <label>:107                                     ; preds = %106
  br label %108

; <label>:108                                     ; preds = %107
  %109 = load i32* %right, align 4
  br label %110

; <label>:110                                     ; preds = %108
  %111 = load i32* %left, align 4
  %112 = icmp slt i32 %109, %111
  %113 = zext i1 %112 to i8
  %114 = trunc i8 %113 to i1
  br i1 %114, label %115, label %116

; <label>:115                                     ; preds = %110
  br label %117

; <label>:116                                     ; preds = %110
  br label %119

; <label>:117                                     ; preds = %115
  br label %118

; <label>:118                                     ; preds = %117
  store i8 0, i8* %var_cont, align 1
  br label %121

; <label>:119                                     ; preds = %116
  br label %120

; <label>:120                                     ; preds = %119
  store i32 0, i32* %nt, align 4
  br label %121

; <label>:121                                     ; preds = %118, %120
  br label %33

; <label>:122                                     ; preds = %38
  br label %123

; <label>:123                                     ; preds = %122
  br label %124

; <label>:124                                     ; preds = %123
  %125 = load %class.BS** %this, align 4
  br label %126

; <label>:126                                     ; preds = %124
  %127 = load i32* %aux01, align 4
  br label %128

; <label>:128                                     ; preds = %126
  %129 = load i32* %num, align 4
  %130 = call i8 @Compare(%class.BS* %125, i32 %127, i32 %129)
  %131 = trunc i8 %130 to i1
  br i1 %131, label %132, label %133

; <label>:132                                     ; preds = %128
  br label %134

; <label>:133                                     ; preds = %128
  br label %136

; <label>:134                                     ; preds = %132
  br label %135

; <label>:135                                     ; preds = %134
  store i8 1, i8* %bs01, align 1
  br label %138

; <label>:136                                     ; preds = %133
  br label %137

; <label>:137                                     ; preds = %136
  store i8 0, i8* %bs01, align 1
  br label %138

; <label>:138                                     ; preds = %135, %137
  br label %139

; <label>:139                                     ; preds = %138
  %140 = load i8* %bs01, align 4
  ret i8 %140
}

define linkonce_odr i32 @Div(%class.BS* %arg_this, i32 %arg_num) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BS*
  store %class.BS* %arg_this, %class.BS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %num = alloca i32, align 4
  store i32 %arg_num, i32* %num, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %count01 = alloca i32, align 4
  br label %4

; <label>:4                                       ; preds = %3
  %count02 = alloca i32, align 4
  br label %5

; <label>:5                                       ; preds = %4
  %aux03 = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  br label %7

; <label>:7                                       ; preds = %6
  store i32 0, i32* %count01, align 4
  br label %8

; <label>:8                                       ; preds = %7
  br label %9

; <label>:9                                       ; preds = %8
  store i32 0, i32* %count02, align 4
  br label %10

; <label>:10                                      ; preds = %9
  br label %11

; <label>:11                                      ; preds = %10
  br label %12

; <label>:12                                      ; preds = %11
  %13 = load i32* %num, align 4
  br label %14

; <label>:14                                      ; preds = %12
  %15 = sub i32 %13, 1
  store i32 %15, i32* %aux03, align 4
  br label %16

; <label>:16                                      ; preds = %14
  br label %17

; <label>:17                                      ; preds = %39, %16
  br label %18

; <label>:18                                      ; preds = %17
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %count02, align 4
  br label %21

; <label>:21                                      ; preds = %19
  %22 = load i32* %aux03, align 4
  %23 = icmp slt i32 %20, %22
  %24 = zext i1 %23 to i8
  %25 = trunc i8 %24 to i1
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %21
  br label %28

; <label>:27                                      ; preds = %21
  br label %41

; <label>:28                                      ; preds = %26
  br label %29

; <label>:29                                      ; preds = %28
  br label %30

; <label>:30                                      ; preds = %29
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32* %count01, align 4
  br label %33

; <label>:33                                      ; preds = %31
  %34 = add i32 %32, 1
  store i32 %34, i32* %count01, align 4
  br label %35

; <label>:35                                      ; preds = %33
  br label %36

; <label>:36                                      ; preds = %35
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %count02, align 4
  br label %39

; <label>:39                                      ; preds = %37
  %40 = add i32 %38, 2
  store i32 %40, i32* %count02, align 4
  br label %17

; <label>:41                                      ; preds = %27
  %42 = load i32* %count01, align 4
  ret i32 %42
}

define linkonce_odr i8 @Compare(%class.BS* %arg_this, i32 %arg_num1, i32 %arg_num2) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BS*
  store %class.BS* %arg_this, %class.BS** %this, align 8
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
  %retval = alloca i8, align 1
  br label %5

; <label>:5                                       ; preds = %4
  %aux02 = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  br label %7

; <label>:7                                       ; preds = %6
  store i8 0, i8* %retval, align 1
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
  store i32 %13, i32* %aux02, align 4
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
  store i8 0, i8* %retval, align 1
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
  %33 = load i32* %aux02, align 4
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
  store i8 0, i8* %retval, align 1
  br label %46

; <label>:44                                      ; preds = %41
  br label %45

; <label>:45                                      ; preds = %44
  store i8 1, i8* %retval, align 1
  br label %46

; <label>:46                                      ; preds = %43, %45
  br label %47

; <label>:47                                      ; preds = %26, %46
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i8* %retval, align 4
  ret i8 %49
}

define linkonce_odr i32 @Print(%class.BS* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BS*
  store %class.BS* %arg_this, %class.BS** %this, align 8
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
  %11 = load %class.BS** %this
  %12 = getelementptr %class.BS* %11, i32 0, i32 1
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
  %23 = load %class.BS** %this
  %24 = getelementptr %class.BS* %23, i32 0, i32 0
  %25 = load i32** %24, align 4
  br label %26

; <label>:26                                      ; preds = %22
  %27 = load i32* %j, align 4
  %28 = add i32 %27, 1
  %29 = getelementptr i32* %25, i32 %28
  %30 = load i32* %29, align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str16, i32 0, i32 0), i32 %30)
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
  br label %39

; <label>:39                                      ; preds = %38
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str17, i32 0, i32 0), i32 99999)
  br label %41

; <label>:41                                      ; preds = %39
  ret i32 0
}

define linkonce_odr i32 @Init(%class.BS* %arg_this, i32 %arg_sz) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.BS*
  store %class.BS* %arg_this, %class.BS** %this, align 8
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
  %aux02 = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  %aux01 = alloca i32, align 4
  br label %7

; <label>:7                                       ; preds = %6
  br label %8

; <label>:8                                       ; preds = %7
  %9 = load i32* %sz, align 4
  %10 = load %class.BS** %this
  %11 = getelementptr %class.BS* %10, i32 0, i32 1
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
  %21 = load %class.BS** %this
  %22 = getelementptr %class.BS* %21, i32 0, i32 0
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
  %28 = load %class.BS** %this
  %29 = getelementptr %class.BS* %28, i32 0, i32 1
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
  %39 = load %class.BS** %this
  %40 = getelementptr %class.BS* %39, i32 0, i32 1
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
  %70 = load %class.BS** %this
  %71 = getelementptr %class.BS* %70, i32 0, i32 0
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
