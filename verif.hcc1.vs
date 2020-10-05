#! /bin/csh -vxf

setenv VERIF_REQUIRE_CLEAN 1

set bit=`sizeoflongx8.exe`
if ( $status != 0 ) then
  exit 1
endif
if ($cwd:t == 46_optimization) then
  if ($BATCH_BUILD_VS_X86) then
    set bit = 32
  endif
else
  if (x$INTEL_DLL_EXTRA_OPTION == x"--x86") then
    set bit = 32
  endif
  if ($BATCH_BUILD_VS_X86) then
    if ($CC1GENERATOR == $LANG_PROJECT_ROOT/bin/tacsim.dll) then
      set bit = 32
    endif
  endif
endif

find . -name \*.common -exec overwrite {} \;
find . -name \*.$bit -exec overwrite {} \;
find . -name '*.vs' -exec overwrite {} \;
find . -name '*.conly' -exec overwrite {} \;
if ($CC1GENERATOR == $LANG_PROJECT_ROOT/bin/tacsim.dll) then
  find . -name '*.tacsim' -exec overwrite {} \;
else
  if ($INTEL_DLL_MS_MODE == 0) then
    find . -name '*.normal' -exec overwrite {} \;
  else
    find . -name '*.ms' -exec overwrite {} \;
    if ($bit == "32") then
      find . -name '*.ms86' -exec overwrite {} \;
    endif
  endif
endif
if ($CC1GENERATOR == $LANG_PROJECT_ROOT/bin/printf_chk.dll) then
  find . -name '*.chk' -exec overwrite {} \;
endif
find . -name '*.cc1' -exec overwrite {} \;

if ($cwd:t == 46_optimization) then
  if ($INTEL_DLL_MS_MODE == 1) then
    if (x$INTEL_DLL_EXTRA_OPTION == x"--x86") then
      cp test019.lof.cc1.ms86 test019.lof
    else
      cp test019.lof.cc1.ms64 test019.lof
    endif
  endif
endif

if ( $bit == "32" && $CC1GENERATOR == $LANG_PROJECT_ROOT/bin/intel.dll ) then
  if ($INTEL_DLL_MS_MODE == 0) then
    set extra_option = "--x86"
  else
    set extra_option = "--x86 --ms"
  endif
else  
  if ($INTEL_DLL_MS_MODE == 0) then
    set extra_option = ""
  else
    set extra_option = "--ms"
  endif
endif

if ($VERIF_REQUIRE_CLEAN == 1) then
  make clean
endif

if ($CC1GENERATOR == $LANG_PROJECT_ROOT/bin/tacsim.dll) then
make -k 'MY_MAKEFLAGS=-k' 'DOS2UNIX=unix2dos' 'EUC2SJIS=cat' 'EXTRA_CPP_FLAG=-Id:/cygwin64/usr/include -Id:/cygwin64/lib/gcc/x86_64-pc-cygwin/9.3.0/include -D__x86_64__ -D__CYGWIN__ -D__WCHAR_TYPE__="unsigned short int"' 'EXTRA_CPP_FLAG_TACSIM_VS=-DUSE_BUILTIN_VA_ARG'
else if ($CC1GENERATOR == $LANG_PROJECT_ROOT/bin/printf_chk.dll) then
make -k 'MY_MAKEFLAGS=-k' 'DOS2UNIX=unix2dos' 'EUC2SJIS=cat' 'EXTRA_CPP_FLAG=-Id:/cygwin64/usr/include -Id:/cygwin64/lib/gcc/x86_64-pc-cygwin/9.3.0/include -D__x86_64__ -D__CYGWIN__ -D__WCHAR_TYPE__="unsigned short int"'
else if ($INTEL_DLL_MS_MODE == 1) then
make -k 'MY_MAKEFLAGS=-k' 'DOS2UNIX=unix2dos' 'EUC2SJIS=cat' 'EXTRA_CPP_FLAG=' "CC1_FLAG=--generator-option \( --debug $extra_option \)"
else
make -k 'MY_MAKEFLAGS=-k' 'DOS2UNIX=unix2dos' 'EUC2SJIS=cat' 'EXTRA_CPP_FLAG=-Id:/cygwin64/usr/include -Id:/cygwin64/lib/gcc/x86_64-pc-cygwin/9.3.0/include -D__x86_64__ -D__CYGWIN__ -D__WCHAR_TYPE__="unsigned short int"' "CC1_FLAG=--generator-option \( --debug $extra_option \)"
endif

