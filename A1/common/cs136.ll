; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@READ_FAIL = constant i32 -2147483648, align 4
@TRACE_FLAG = internal global i8 1, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [19 x i8] c">>> [%s|%s|%d] >> \00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%s%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"%s => %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"%s => %c\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"%s => %f\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"%s => %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"%s => %p\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: nounwind
define void @trace_off() #0 {
  store i8 0, i8* @TRACE_FLAG, align 1
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_MSG(i8* %expstr, i8* %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i8*, align 8
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i8* %expval, i8** %expval.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load i8, i8* @TRACE_FLAG, align 1
  %tobool = trunc i8 %1 to i1
  br i1 %tobool, label %2, label %10

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %4, i32 47) #3
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %5 = load i8*, i8** %funcname.addr, align 8
  %6 = load i32, i32* %lineno.addr, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i8* %add.ptr, i8* %5, i32 %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = load i8*, i8** %expstr.addr, align 8
  %9 = load i8*, i8** %expval.addr, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* %8, i8* %9)
  br label %10

; <label>:10:                                     ; preds = %2, %0
  ret void
}

; Function Attrs: nounwind readonly
declare i8* @strrchr(i8*, i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
define void @_TRACE_INT(i8* %expstr, i32 %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i32, align 4
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i32 %expval, i32* %expval.addr, align 4
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load i8, i8* @TRACE_FLAG, align 1
  %tobool = trunc i8 %1 to i1
  br i1 %tobool, label %2, label %10

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %4, i32 47) #3
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %5 = load i8*, i8** %funcname.addr, align 8
  %6 = load i32, i32* %lineno.addr, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i8* %add.ptr, i8* %5, i32 %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = load i8*, i8** %expstr.addr, align 8
  %9 = load i32, i32* %expval.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i8* %8, i32 %9)
  br label %10

; <label>:10:                                     ; preds = %2, %0
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_CHAR(i8* %expstr, i8 signext %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i8, align 1
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i8 %expval, i8* %expval.addr, align 1
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load i8, i8* @TRACE_FLAG, align 1
  %tobool = trunc i8 %1 to i1
  br i1 %tobool, label %2, label %10

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %4, i32 47) #3
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %5 = load i8*, i8** %funcname.addr, align 8
  %6 = load i32, i32* %lineno.addr, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i8* %add.ptr, i8* %5, i32 %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = load i8*, i8** %expstr.addr, align 8
  %9 = load i8, i8* %expval.addr, align 1
  %conv = sext i8 %9 to i32
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i8* %8, i32 %conv)
  br label %10

; <label>:10:                                     ; preds = %2, %0
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_DOUBLE(i8* %expstr, double %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca double, align 8
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store double %expval, double* %expval.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load i8, i8* @TRACE_FLAG, align 1
  %tobool = trunc i8 %1 to i1
  br i1 %tobool, label %2, label %10

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %4, i32 47) #3
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %5 = load i8*, i8** %funcname.addr, align 8
  %6 = load i32, i32* %lineno.addr, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i8* %add.ptr, i8* %5, i32 %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = load i8*, i8** %expstr.addr, align 8
  %9 = load double, double* %expval.addr, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i8* %8, double %9)
  br label %10

; <label>:10:                                     ; preds = %2, %0
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_STRING(i8* %expstr, i8* %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i8*, align 8
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i8* %expval, i8** %expval.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load i8, i8* @TRACE_FLAG, align 1
  %tobool = trunc i8 %1 to i1
  br i1 %tobool, label %2, label %10

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %4, i32 47) #3
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %5 = load i8*, i8** %funcname.addr, align 8
  %6 = load i32, i32* %lineno.addr, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i8* %add.ptr, i8* %5, i32 %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = load i8*, i8** %expstr.addr, align 8
  %9 = load i8*, i8** %expval.addr, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0), i8* %8, i8* %9)
  br label %10

; <label>:10:                                     ; preds = %2, %0
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_PTR(i8* %expstr, i8* %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i8*, align 8
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i8* %expval, i8** %expval.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load i8, i8* @TRACE_FLAG, align 1
  %tobool = trunc i8 %1 to i1
  br i1 %tobool, label %2, label %10

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %4, i32 47) #3
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %5 = load i8*, i8** %funcname.addr, align 8
  %6 = load i32, i32* %lineno.addr, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i8* %add.ptr, i8* %5, i32 %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = load i8*, i8** %expstr.addr, align 8
  %9 = load i8*, i8** %expval.addr, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i8* %8, i8* %9)
  br label %10

; <label>:10:                                     ; preds = %2, %0
  ret void
}

; Function Attrs: nounwind
define i32 @read_int() #0 {
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i32* %i)
  store i32 %call, i32* %result, align 4
  %1 = load i32, i32* %result, align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %2, label %3

; <label>:2:                                      ; preds = %0
  store i32 -2147483648, i32* %retval, align 4
  br label %5

; <label>:3:                                      ; preds = %0
  %4 = load i32, i32* %i, align 4
  store i32 %4, i32* %retval, align 4
  br label %5

; <label>:5:                                      ; preds = %3, %2
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare i32 @__isoc99_scanf(i8*, ...) #2

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 "}
