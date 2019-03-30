#! /bin/csh -f

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
    if ($CXX1GENERATOR == $LANG_PROJECT_ROOT/bin/tacsimxx.dll) then
      set bit = 32
    endif
  endif
endif

find . -name \*.$bit -exec overwrite {} \;
find . -name '*.vs' -exec overwrite {} \;
find . -name '*.cxx1' -exec overwrite {} \;
find . -name '*.conly' -exec takeoff {} \;
if ($CXX1GENERATOR == $LANG_PROJECT_ROOT/bin/tacsimxx.dll) then
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
if ($CXX1GENERATOR == $LANG_PROJECT_ROOT/bin/printf_chkxx.dll) then
  find . -name '*.chk' -exec overwrite {} \;
endif

if ( $bit == "32" && $CXX1GENERATOR == $LANG_PROJECT_ROOT/bin/intelxx.dll ) then
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

if ($CXX1GENERATOR == $LANG_PROJECT_ROOT/bin/tacsimxx.dll) then
make -k 'MY_MAKEFLAGS=-k' 'EUC2SJIS=cat' 'CC1=hcxx1.exe' 'EXTRA_CPP_FLAG=-Id:/cygwin64/usr/include -Id:/cygwin64/lib/gcc/x86_64-pc-cygwin/7.3.0/include -D__cplusplus -D_WCHAR_T_DEFINED -D__x86_64__ -D__CYGWIN__ -D__WCHAR_TYPE__="unsigned short int"' 'EXTRA_CPP_FLAG_TACSIM_VS=-D__cplusplus -D_WCHAR_T_DEFINED -DUSE_BUILTIN_VA_ARG'
else
if ($CXX1GENERATOR == $LANG_PROJECT_ROOT/bin/printf_chkxx.dll) then
make -k 'MY_MAKEFLAGS=-k' 'EUC2SJIS=cat' 'CC1=hcxx1.exe' 'EXTRA_CPP_FLAG=-Id:/cygwin64/usr/include -Id:/cygwin64/lib/gcc/x86_64-pc-cygwin/7.3.0/include -D__cplusplus -D_WCHAR_T_DEFINED -D__x86_64__ -D__CYGWIN__ -D__WCHAR_TYPE__="unsigned short int"'
else
make -k 'MY_MAKEFLAGS=-k' 'EUC2SJIS=cat' 'CC1=hcxx1.exe' 'EXTRA_CPP_FLAG=-Id:/cygwin64/usr/include -Id:/cygwin64/lib/gcc/x86_64-pc-cygwin/7.3.0/include -D__cplusplus -D__x86_64__ -D__CYGWIN__ -D__WCHAR_TYPE__="unsigned short int"' "CC1_FLAG=--generator-option \( --debug $extra_option \)"
endif
endif
