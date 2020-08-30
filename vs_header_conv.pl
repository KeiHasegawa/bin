#! /usr/bin/env perl

$state = 0;

while ( <> ) {
    chop $_;
    next if (/inline   int  __swprintf_l\(   wchar_t \*_Buffer,     wchar_t const\* _Format,   _locale_t _Locale, ...\);  inline   int  __vswprintf_l\(   wchar_t \*_Buffer,     wchar_t const\* _Format,   _locale_t _Locale, va_list _Args\);/);
    next if (/int  __swprintf_l\(   wchar_t \*_Buffer,     wchar_t const\* _Format,   _locale_t _Locale, ...\);     int  __vswprintf_l\(   wchar_t \*_Buffer,     wchar_t const\* _Format,   _locale_t _Locale, va_list _Args\);/);
    next if (/inline   int  _swprintf\(   wchar_t \*_Buffer,     wchar_t const\* _Format, ...\);  inline   int  _vswprintf\(   wchar_t \*_Buffer,     wchar_t const\* _Format, va_list _Args\);/);
    next if (/int  _swprintf\(   wchar_t \*_Buffer,     wchar_t const\* _Format, ...\);     int  _vswprintf\(   wchar_t \*_Buffer,     wchar_t const\* _Format, va_list _Args\);/);
    next if (/int  sprintf\( char \*_Buffer, char const\* _Format, ...\);   int  vsprintf\( char \*_Buffer, char const\* _Format, va_list _Args\);/);
    next if (/int  _snprintf\(    char \*_Buffer,   size_t _BufferCount,     char const\* _Format, ...\);     int  _vsnprintf\(    char \*_Buffer,   size_t _BufferCount,     char const\* _Format, va_list _Args\);/);
    s/__va_start\(&(.*),(.*)\)/__builtin_va_start(\1,\2)/;
    if ($state == 0 && /inline  unsigned  long long \*   __local_stdio_.*_options\(void\)/) {
	$state = 1;
	s/inline//;
	s/\(void\)/\(void\);/;
    }
    elsif ($state == 1) {
	if (/}/) {
	    $state = 0;
	    next;
	}
	next;
    }
    s/#pragma.*extern/extern/;
    s/#pragma.*template/template/;
    s/#pragma.*}/}/;
    s/__countof_helper\( __unaligned  _CountofType/__countof_helper\(  _CountofType/;
    print $_, "\n";
}
