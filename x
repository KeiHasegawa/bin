#! /bin/csh -xf

if ($argv[1]:e == "bpp") then
  git mv $argv[1] $argv[1]:r.cpp || exit 1
endif
hcpp.exe -I/usr/include -I/usr/local/lib/gcc/i686-pc-linux-gnu/6.4.0/include -D__cplusplus -U__FreeBSD__ -Dlinux -D__WCHAR_TYPE__="long" -D__declspec\(a\)= -D__cdecl= -D__inline__=inline -D__extension__= -D__attribute__\(a\)= -D__builtin_va_list='char*' -D__builtin_stdarg_start=__builtin_va_start -D__asm__=asm -W 0 -H -o $argv[1]:r.i $argv[1]:r.cpp || exit 1
hcxx1.exe -o $argv[1]:r.s $argv[1]:r.i --generator-option \( --debug --x86 \) || exit 1
g++ -g -o $argv[1]:r.exe $argv[1]:r.s || exit 1
./$argv[1]:r.exe > $argv[1]:r.log || exit 1
dos2unix.csh $argv[1]:r.log
diff $argv[1]:r.log $argv[1]:r.lof
