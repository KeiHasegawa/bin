#! /bin/csh -vxf

echo "pid : $$"

date

setenv INTEL_DLL_MS_MODE 0
setenv INTEL_DLL_EXTRA_OPTION
setenv DO_HCC1_TEST 1
setenv DO_HCXX1_TEST 0
setenv DO_HCXX1_C_TEST 0
    
if ($#argv == 1) then
  if (x$argv[1] == x"--ms") then
    setenv INTEL_DLL_MS_MODE 1
  else
    if (x$argv[1] == x"--ms86") then
      setenv INTEL_DLL_MS_MODE 1
      setenv INTEL_DLL_EXTRA_OPTION "--x86"
    else
      echo "usage % $0 [--ms|--ms86]"
      exit 1
    endif
  endif
endif

setenv LANG C

install.wdog
install.sjis2euc
install.euc2sjis
install.euc2utf
install.utf2euc
install.plathome
install.sizeoflongx8

unsetenv BATCH_BUILD_VS_CLEAN
setenv BATCH_BUILD_VS_CONFIGURATION Release
setenv BATCH_BUILD_VS_X86 1

if ($?BATCH_BUILD_VS_X86 == 0) then
  setenv BATCH_BUILD_VS_X86 0
endif
if ($?BATCH_BUILD_VS_CONFIGURATION == 0) then
  setenv BATCH_BUILD_VS_CONFIGURATION Debug
endif

batch_build.vs
if ( $status != 0 ) then
  exit 1
endif
install.hcc1.vs
if ( $status != 0 ) then
  exit 1
endif

cd $LANG_PROJECT_ROOT/41_ISO_IEC_9899/6_Language
rm -f 2_Conversions/40_ulonglong/test064.lof.tacsim
rm -f 2_Conversions/40_ulonglong/test065.lof.tacsim
if ($CC1GENERATOR == $LANG_PROJECT_ROOT/bin/intel.dll && $INTEL_DLL_MS_MODE == 0 || $CC1GENERATOR == $LANG_PROJECT_ROOT/bin/printf_chk.dll) then
  cp 1_Lexical_elements/3_Constants/1_Floating_constants/1_ok/test003.c{.intel,}
  cp 2_Conversions/1_Arithmetic_operands/4_Real_floating_types/1_ok/test001.c{.intel,}
  cp 2_Conversions/1_Arithmetic_operands/4_Real_floating_types/1_ok/test002.c{.intel,}
else
  rm -f 1_Lexical_elements/3_Constants/1_Floating_constants/1_ok/test003.c
  rm -f 2_Conversions/1_Arithmetic_operands/4_Real_floating_types/1_ok/test001.c
  rm -f 2_Conversions/1_Arithmetic_operands/4_Real_floating_types/1_ok/test002.c
endif

set date1 = `date +%m.%d.%H.%M`
echo $date1

if ($DO_HCC1_TEST == 1) then
  cd $LANG_PROJECT_ROOT/41_ISO_IEC_9899
  verif.hcc1.vs >& ~/garbage/41_ISO_IEC_9899.log.vs.$date1
  pass_count.pl ~/garbage/41_ISO_IEC_9899.log.vs.$date1

  cd $LANG_PROJECT_ROOT/42_C2nd
  verif.hcc1.vs >& ~/garbage/42_C2nd.log.vs.$date1
  pass_count.pl ~/garbage/42_C2nd.log.vs.$date1

  cd $LANG_PROJECT_ROOT/46_optimization
  verif.hcc1.vs >& ~/garbage/46_optimization.log.vs.$date1
  pass_count.pl ~/garbage/46_optimization.log.vs.$date1

  date +%m.%d.%H.%M
endif  

set date2 = `date +%m.%d.%H.%M`
echo $date2

if ($DO_HCXX1_TEST == 1) then
  if ($DO_HCXX1_C_TEST == 1) then
    cd $LANG_PROJECT_ROOT/41_ISO_IEC_9899
    verif.hcxx1.vs >& ~/garbage/41_ISO_IEC_9899xx.log.vs.$date2
    pass_count.pl ~/garbage/41_ISO_IEC_9899xx.log.vs.$date2

    cd $LANG_PROJECT_ROOT/42_C2nd
    verif.hcxx1.vs >& ~/garbage/42_C2ndxx.log.vs.$date2
    pass_count.pl ~/garbage/42_C2ndxx.log.vs.$date2

    cd $LANG_PROJECT_ROOT/46_optimization
    verif.hcxx1.vs >& ~/garbage/46_optimizationxx.log.vs.$date2
    pass_count.pl ~/garbage/46_optimizationxx.log.vs.$date2
  endif
  cd $LANG_PROJECT_ROOT/43_ISO_IEC_14882
  verif.hcxx1.vs >& ~/garbage/43_ISO_IEC_14882.log.vs.$date2
  pass_count.pl ~/garbage/43_ISO_IEC_14882.log.vs.$date2

  date +%m.%d.%H.%M
endif
