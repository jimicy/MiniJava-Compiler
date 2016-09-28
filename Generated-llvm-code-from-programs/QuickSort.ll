; ModuleID = 'QuickSort.ll'

%class.QS = type { i32*, i32 }

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
  %3 = call noalias i8* @_Znwm(i64 ptrtoint (%class.QS* getelementptr (%class.QS* null, i32 1) to i64))
  %4 = bitcast i8* %3 to %class.QS*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 ptrtoint (%class.QS* getelementptr (%class.QS* null, i32 1) to i64), i32 8, i1 false)
  br label %5

; <label>:5                                       ; preds = %2
  %6 = call i32 @Start(%class.QS* %4, i32 10)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 %6)
  ret void
}

declare i32 @printf(i8*, ...)

declare noalias i8* @_Znam(i64)

declare noalias i8* @_Znwm(i64)

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #0

define linkonce_odr i32 @Start(%class.QS* %arg_this, i32 %arg_sz) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.QS*
  store %class.QS* %arg_this, %class.QS** %this, align 8
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
  %7 = load %class.QS** %this, align 4
  br label %8

; <label>:8                                       ; preds = %6
  %9 = load i32* %sz, align 4
  %10 = call i32 @Init(%class.QS* %7, i32 %9)
  store i32 %10, i32* %aux01, align 4
  br label %11

; <label>:11                                      ; preds = %8
  br label %12

; <label>:12                                      ; preds = %11
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load %class.QS** %this, align 4
  %15 = call i32 @Print(%class.QS* %14)
  store i32 %15, i32* %aux01, align 4
  br label %16

; <label>:16                                      ; preds = %13
  br label %17

; <label>:17                                      ; preds = %16
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 9999)
  br label %19

; <label>:19                                      ; preds = %17
  br label %20

; <label>:20                                      ; preds = %19
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load %class.QS** %this
  %23 = getelementptr %class.QS* %22, i32 0, i32 1
  %24 = load i32* %23, align 4
  br label %25

; <label>:25                                      ; preds = %21
  %26 = sub i32 %24, 1
  store i32 %26, i32* %aux01, align 4
  br label %27

; <label>:27                                      ; preds = %25
  br label %28

; <label>:28                                      ; preds = %27
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load %class.QS** %this, align 4
  br label %31

; <label>:31                                      ; preds = %29
  br label %32

; <label>:32                                      ; preds = %31
  %33 = load i32* %aux01, align 4
  %34 = call i32 @Sort(%class.QS* %30, i32 0, i32 %33)
  store i32 %34, i32* %aux01, align 4
  br label %35

; <label>:35                                      ; preds = %32
  br label %36

; <label>:36                                      ; preds = %35
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load %class.QS** %this, align 4
  %39 = call i32 @Print(%class.QS* %38)
  store i32 %39, i32* %aux01, align 4
  br label %40

; <label>:40                                      ; preds = %37
  ret i32 0
}

define linkonce_odr i32 @Sort(%class.QS* %arg_this, i32 %arg_left, i32 %arg_right) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.QS*
  store %class.QS* %arg_this, %class.QS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %left = alloca i32, align 4
  store i32 %arg_left, i32* %left, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %right = alloca i32, align 4
  store i32 %arg_right, i32* %right, align 4
  br label %4

; <label>:4                                       ; preds = %3
  %v = alloca i32, align 4
  br label %5

; <label>:5                                       ; preds = %4
  %i = alloca i32, align 4
  br label %6

; <label>:6                                       ; preds = %5
  %j = alloca i32, align 4
  br label %7

; <label>:7                                       ; preds = %6
  %nt = alloca i32, align 4
  br label %8

; <label>:8                                       ; preds = %7
  %t = alloca i32, align 4
  br label %9

; <label>:9                                       ; preds = %8
  %cont01 = alloca i8, align 1
  br label %10

; <label>:10                                      ; preds = %9
  %cont02 = alloca i8, align 1
  br label %11

; <label>:11                                      ; preds = %10
  %aux03 = alloca i32, align 4
  br label %12

; <label>:12                                      ; preds = %11
  br label %13

; <label>:13                                      ; preds = %12
  store i32 0, i32* %t, align 4
  br label %14

; <label>:14                                      ; preds = %13
  br label %15

; <label>:15                                      ; preds = %14
  br label %16

; <label>:16                                      ; preds = %15
  %17 = load i32* %left, align 4
  br label %18

; <label>:18                                      ; preds = %16
  %19 = load i32* %right, align 4
  %20 = icmp slt i32 %17, %19
  %21 = zext i1 %20 to i8
  %22 = trunc i8 %21 to i1
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %18
  br label %25

; <label>:24                                      ; preds = %18
  br label %278

; <label>:25                                      ; preds = %23
  br label %26

; <label>:26                                      ; preds = %25
  br label %27

; <label>:27                                      ; preds = %26
  br label %28

; <label>:28                                      ; preds = %27
  %29 = load %class.QS** %this
  %30 = getelementptr %class.QS* %29, i32 0, i32 0
  %31 = load i32** %30, align 4
  br label %32

; <label>:32                                      ; preds = %28
  %33 = load i32* %right, align 4
  %34 = add i32 %33, 1
  %35 = getelementptr i32* %31, i32 %34
  %36 = load i32* %35, align 4
  store i32 %36, i32* %v, align 4
  br label %37

; <label>:37                                      ; preds = %32
  br label %38

; <label>:38                                      ; preds = %37
  br label %39

; <label>:39                                      ; preds = %38
  %40 = load i32* %left, align 4
  br label %41

; <label>:41                                      ; preds = %39
  %42 = sub i32 %40, 1
  store i32 %42, i32* %i, align 4
  br label %43

; <label>:43                                      ; preds = %41
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %right, align 4
  store i32 %45, i32* %j, align 4
  br label %46

; <label>:46                                      ; preds = %44
  br label %47

; <label>:47                                      ; preds = %46
  store i8 1, i8* %cont01, align 1
  br label %48

; <label>:48                                      ; preds = %47
  br label %49

; <label>:49                                      ; preds = %207, %48
  br label %50

; <label>:50                                      ; preds = %49
  %51 = load i8* %cont01, align 4
  %52 = trunc i8 %51 to i1
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %50
  br label %55

; <label>:54                                      ; preds = %50
  br label %208

; <label>:55                                      ; preds = %53
  br label %56

; <label>:56                                      ; preds = %55
  br label %57

; <label>:57                                      ; preds = %56
  store i8 1, i8* %cont02, align 1
  br label %58

; <label>:58                                      ; preds = %57
  br label %59

; <label>:59                                      ; preds = %102, %58
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i8* %cont02, align 4
  %62 = trunc i8 %61 to i1
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %60
  br label %65

; <label>:64                                      ; preds = %60
  br label %103

; <label>:65                                      ; preds = %63
  br label %66

; <label>:66                                      ; preds = %65
  br label %67

; <label>:67                                      ; preds = %66
  br label %68

; <label>:68                                      ; preds = %67
  %69 = load i32* %i, align 4
  br label %70

; <label>:70                                      ; preds = %68
  %71 = add i32 %69, 1
  store i32 %71, i32* %i, align 4
  br label %72

; <label>:72                                      ; preds = %70
  br label %73

; <label>:73                                      ; preds = %72
  br label %74

; <label>:74                                      ; preds = %73
  %75 = load %class.QS** %this
  %76 = getelementptr %class.QS* %75, i32 0, i32 0
  %77 = load i32** %76, align 4
  br label %78

; <label>:78                                      ; preds = %74
  %79 = load i32* %i, align 4
  %80 = add i32 %79, 1
  %81 = getelementptr i32* %77, i32 %80
  %82 = load i32* %81, align 4
  store i32 %82, i32* %aux03, align 4
  br label %83

; <label>:83                                      ; preds = %78
  br label %84

; <label>:84                                      ; preds = %83
  br label %85

; <label>:85                                      ; preds = %84
  br label %86

; <label>:86                                      ; preds = %85
  %87 = load i32* %aux03, align 4
  br label %88

; <label>:88                                      ; preds = %86
  %89 = load i32* %v, align 4
  %90 = icmp slt i32 %87, %89
  %91 = zext i1 %90 to i8
  %92 = trunc i8 %91 to i1
  %93 = xor i1 %92, true
  %94 = zext i1 %93 to i8
  %95 = trunc i8 %94 to i1
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %88
  br label %98

; <label>:97                                      ; preds = %88
  br label %100

; <label>:98                                      ; preds = %96
  br label %99

; <label>:99                                      ; preds = %98
  store i8 0, i8* %cont02, align 1
  br label %102

; <label>:100                                     ; preds = %97
  br label %101

; <label>:101                                     ; preds = %100
  store i8 1, i8* %cont02, align 1
  br label %102

; <label>:102                                     ; preds = %99, %101
  br label %59

; <label>:103                                     ; preds = %64
  br label %104

; <label>:104                                     ; preds = %103
  store i8 1, i8* %cont02, align 1
  br label %105

; <label>:105                                     ; preds = %104
  br label %106

; <label>:106                                     ; preds = %149, %105
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i8* %cont02, align 4
  %109 = trunc i8 %108 to i1
  br i1 %109, label %110, label %111

; <label>:110                                     ; preds = %107
  br label %112

; <label>:111                                     ; preds = %107
  br label %150

; <label>:112                                     ; preds = %110
  br label %113

; <label>:113                                     ; preds = %112
  br label %114

; <label>:114                                     ; preds = %113
  br label %115

; <label>:115                                     ; preds = %114
  %116 = load i32* %j, align 4
  br label %117

; <label>:117                                     ; preds = %115
  %118 = sub i32 %116, 1
  store i32 %118, i32* %j, align 4
  br label %119

; <label>:119                                     ; preds = %117
  br label %120

; <label>:120                                     ; preds = %119
  br label %121

; <label>:121                                     ; preds = %120
  %122 = load %class.QS** %this
  %123 = getelementptr %class.QS* %122, i32 0, i32 0
  %124 = load i32** %123, align 4
  br label %125

; <label>:125                                     ; preds = %121
  %126 = load i32* %j, align 4
  %127 = add i32 %126, 1
  %128 = getelementptr i32* %124, i32 %127
  %129 = load i32* %128, align 4
  store i32 %129, i32* %aux03, align 4
  br label %130

; <label>:130                                     ; preds = %125
  br label %131

; <label>:131                                     ; preds = %130
  br label %132

; <label>:132                                     ; preds = %131
  br label %133

; <label>:133                                     ; preds = %132
  %134 = load i32* %v, align 4
  br label %135

; <label>:135                                     ; preds = %133
  %136 = load i32* %aux03, align 4
  %137 = icmp slt i32 %134, %136
  %138 = zext i1 %137 to i8
  %139 = trunc i8 %138 to i1
  %140 = xor i1 %139, true
  %141 = zext i1 %140 to i8
  %142 = trunc i8 %141 to i1
  br i1 %142, label %143, label %144

; <label>:143                                     ; preds = %135
  br label %145

; <label>:144                                     ; preds = %135
  br label %147

; <label>:145                                     ; preds = %143
  br label %146

; <label>:146                                     ; preds = %145
  store i8 0, i8* %cont02, align 1
  br label %149

; <label>:147                                     ; preds = %144
  br label %148

; <label>:148                                     ; preds = %147
  store i8 1, i8* %cont02, align 1
  br label %149

; <label>:149                                     ; preds = %146, %148
  br label %106

; <label>:150                                     ; preds = %111
  br label %151

; <label>:151                                     ; preds = %150
  br label %152

; <label>:152                                     ; preds = %151
  %153 = load %class.QS** %this
  %154 = getelementptr %class.QS* %153, i32 0, i32 0
  %155 = load i32** %154, align 4
  br label %156

; <label>:156                                     ; preds = %152
  %157 = load i32* %i, align 4
  %158 = add i32 %157, 1
  %159 = getelementptr i32* %155, i32 %158
  %160 = load i32* %159, align 4
  store i32 %160, i32* %t, align 4
  br label %161

; <label>:161                                     ; preds = %156
  br label %162

; <label>:162                                     ; preds = %161
  %163 = load i32* %i, align 4
  br label %164

; <label>:164                                     ; preds = %162
  br label %165

; <label>:165                                     ; preds = %164
  %166 = load %class.QS** %this
  %167 = getelementptr %class.QS* %166, i32 0, i32 0
  %168 = load i32** %167, align 4
  br label %169

; <label>:169                                     ; preds = %165
  %170 = load i32* %j, align 4
  %171 = add i32 %170, 1
  %172 = getelementptr i32* %168, i32 %171
  %173 = load i32* %172, align 4
  %174 = add i32 %163, 1
  %175 = load %class.QS** %this
  %176 = getelementptr %class.QS* %175, i32 0, i32 0
  %177 = load i32** %176, align 8
  %178 = getelementptr i32* %177, i32 %174
  store i32 %173, i32* %178, align 4
  br label %179

; <label>:179                                     ; preds = %169
  br label %180

; <label>:180                                     ; preds = %179
  %181 = load i32* %j, align 4
  br label %182

; <label>:182                                     ; preds = %180
  %183 = load i32* %t, align 4
  %184 = add i32 %181, 1
  %185 = load %class.QS** %this
  %186 = getelementptr %class.QS* %185, i32 0, i32 0
  %187 = load i32** %186, align 8
  %188 = getelementptr i32* %187, i32 %184
  store i32 %183, i32* %188, align 4
  br label %189

; <label>:189                                     ; preds = %182
  br label %190

; <label>:190                                     ; preds = %189
  br label %191

; <label>:191                                     ; preds = %190
  %192 = load i32* %j, align 4
  br label %193

; <label>:193                                     ; preds = %191
  br label %194

; <label>:194                                     ; preds = %193
  %195 = load i32* %i, align 4
  br label %196

; <label>:196                                     ; preds = %194
  %197 = add i32 %195, 1
  %198 = icmp slt i32 %192, %197
  %199 = zext i1 %198 to i8
  %200 = trunc i8 %199 to i1
  br i1 %200, label %201, label %202

; <label>:201                                     ; preds = %196
  br label %203

; <label>:202                                     ; preds = %196
  br label %205

; <label>:203                                     ; preds = %201
  br label %204

; <label>:204                                     ; preds = %203
  store i8 0, i8* %cont01, align 1
  br label %207

; <label>:205                                     ; preds = %202
  br label %206

; <label>:206                                     ; preds = %205
  store i8 1, i8* %cont01, align 1
  br label %207

; <label>:207                                     ; preds = %204, %206
  br label %49

; <label>:208                                     ; preds = %54
  br label %209

; <label>:209                                     ; preds = %208
  %210 = load i32* %j, align 4
  br label %211

; <label>:211                                     ; preds = %209
  br label %212

; <label>:212                                     ; preds = %211
  %213 = load %class.QS** %this
  %214 = getelementptr %class.QS* %213, i32 0, i32 0
  %215 = load i32** %214, align 4
  br label %216

; <label>:216                                     ; preds = %212
  %217 = load i32* %i, align 4
  %218 = add i32 %217, 1
  %219 = getelementptr i32* %215, i32 %218
  %220 = load i32* %219, align 4
  %221 = add i32 %210, 1
  %222 = load %class.QS** %this
  %223 = getelementptr %class.QS* %222, i32 0, i32 0
  %224 = load i32** %223, align 8
  %225 = getelementptr i32* %224, i32 %221
  store i32 %220, i32* %225, align 4
  br label %226

; <label>:226                                     ; preds = %216
  br label %227

; <label>:227                                     ; preds = %226
  %228 = load i32* %i, align 4
  br label %229

; <label>:229                                     ; preds = %227
  br label %230

; <label>:230                                     ; preds = %229
  %231 = load %class.QS** %this
  %232 = getelementptr %class.QS* %231, i32 0, i32 0
  %233 = load i32** %232, align 4
  br label %234

; <label>:234                                     ; preds = %230
  %235 = load i32* %right, align 4
  %236 = add i32 %235, 1
  %237 = getelementptr i32* %233, i32 %236
  %238 = load i32* %237, align 4
  %239 = add i32 %228, 1
  %240 = load %class.QS** %this
  %241 = getelementptr %class.QS* %240, i32 0, i32 0
  %242 = load i32** %241, align 8
  %243 = getelementptr i32* %242, i32 %239
  store i32 %238, i32* %243, align 4
  br label %244

; <label>:244                                     ; preds = %234
  br label %245

; <label>:245                                     ; preds = %244
  %246 = load i32* %right, align 4
  br label %247

; <label>:247                                     ; preds = %245
  %248 = load i32* %t, align 4
  %249 = add i32 %246, 1
  %250 = load %class.QS** %this
  %251 = getelementptr %class.QS* %250, i32 0, i32 0
  %252 = load i32** %251, align 8
  %253 = getelementptr i32* %252, i32 %249
  store i32 %248, i32* %253, align 4
  br label %254

; <label>:254                                     ; preds = %247
  br label %255

; <label>:255                                     ; preds = %254
  br label %256

; <label>:256                                     ; preds = %255
  %257 = load %class.QS** %this, align 4
  br label %258

; <label>:258                                     ; preds = %256
  %259 = load i32* %left, align 4
  br label %260

; <label>:260                                     ; preds = %258
  br label %261

; <label>:261                                     ; preds = %260
  %262 = load i32* %i, align 4
  br label %263

; <label>:263                                     ; preds = %261
  %264 = sub i32 %262, 1
  %265 = call i32 @Sort(%class.QS* %257, i32 %259, i32 %264)
  store i32 %265, i32* %nt, align 4
  br label %266

; <label>:266                                     ; preds = %263
  br label %267

; <label>:267                                     ; preds = %266
  br label %268

; <label>:268                                     ; preds = %267
  %269 = load %class.QS** %this, align 4
  br label %270

; <label>:270                                     ; preds = %268
  br label %271

; <label>:271                                     ; preds = %270
  %272 = load i32* %i, align 4
  br label %273

; <label>:273                                     ; preds = %271
  %274 = add i32 %272, 1
  br label %275

; <label>:275                                     ; preds = %273
  %276 = load i32* %right, align 4
  %277 = call i32 @Sort(%class.QS* %269, i32 %274, i32 %276)
  store i32 %277, i32* %nt, align 4
  br label %280

; <label>:278                                     ; preds = %24
  br label %279

; <label>:279                                     ; preds = %278
  store i32 0, i32* %nt, align 4
  br label %280

; <label>:280                                     ; preds = %275, %279
  br label %281

; <label>:281                                     ; preds = %280
  ret i32 0
}

define linkonce_odr i32 @Print(%class.QS* %arg_this) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.QS*
  store %class.QS* %arg_this, %class.QS** %this, align 8
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
  %11 = load %class.QS** %this
  %12 = getelementptr %class.QS* %11, i32 0, i32 1
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
  %23 = load %class.QS** %this
  %24 = getelementptr %class.QS* %23, i32 0, i32 0
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

define linkonce_odr i32 @Init(%class.QS* %arg_this, i32 %arg_sz) align 2 {
  br label %1

; <label>:1                                       ; preds = %0
  %this = alloca %class.QS*
  store %class.QS* %arg_this, %class.QS** %this, align 8
  br label %2

; <label>:2                                       ; preds = %1
  %sz = alloca i32, align 4
  store i32 %arg_sz, i32* %sz, align 4
  br label %3

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3
  %5 = load i32* %sz, align 4
  %6 = load %class.QS** %this
  %7 = getelementptr %class.QS* %6, i32 0, i32 1
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
  %17 = load %class.QS** %this
  %18 = getelementptr %class.QS* %17, i32 0, i32 0
  store i32* %newint, i32** %18, align 8
  br label %19

; <label>:19                                      ; preds = %10
  br label %20

; <label>:20                                      ; preds = %19
  br label %21

; <label>:21                                      ; preds = %20
  %22 = add i32 0, 1
  %23 = load %class.QS** %this
  %24 = getelementptr %class.QS* %23, i32 0, i32 0
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
  %31 = load %class.QS** %this
  %32 = getelementptr %class.QS* %31, i32 0, i32 0
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
  %39 = load %class.QS** %this
  %40 = getelementptr %class.QS* %39, i32 0, i32 0
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
  %47 = load %class.QS** %this
  %48 = getelementptr %class.QS* %47, i32 0, i32 0
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
  %55 = load %class.QS** %this
  %56 = getelementptr %class.QS* %55, i32 0, i32 0
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
  %63 = load %class.QS** %this
  %64 = getelementptr %class.QS* %63, i32 0, i32 0
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
  %71 = load %class.QS** %this
  %72 = getelementptr %class.QS* %71, i32 0, i32 0
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
  %79 = load %class.QS** %this
  %80 = getelementptr %class.QS* %79, i32 0, i32 0
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
  %87 = load %class.QS** %this
  %88 = getelementptr %class.QS* %87, i32 0, i32 0
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
  %95 = load %class.QS** %this
  %96 = getelementptr %class.QS* %95, i32 0, i32 0
  %97 = load i32** %96, align 8
  %98 = getelementptr i32* %97, i32 %94
  store i32 5, i32* %98, align 4
  br label %99

; <label>:99                                      ; preds = %93
  ret i32 0
}

attributes #0 = { nounwind }
