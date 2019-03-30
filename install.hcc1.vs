#! /bin/csh -f

if ($BATCH_BUILD_VS_X86) then
  set xxx =     "$BATCH_BUILD_VS_CONFIGURATION"
else
  set xxx = "x64/$BATCH_BUILD_VS_CONFIGURATION"
endif 

cp $LANG_PROJECT_ROOT/10_hcpp/src/$xxx/hcpp.exe \
   $LANG_PROJECT_ROOT/bin || exit 1

cp $LANG_PROJECT_ROOT/20_hcc1/src/$xxx/hcc1.exe \
   $LANG_PROJECT_ROOT/bin || exit 1
   
cp $LANG_PROJECT_ROOT/30_intel/src/$xxx/intel.dll \
   $LANG_PROJECT_ROOT/bin || exit 1

cp $LANG_PROJECT_ROOT/31_sparc/src/$xxx/sparc.dll \
   $LANG_PROJECT_ROOT/bin || exit 1

cp $LANG_PROJECT_ROOT/32_ppc/src/$xxx/ppc.dll \
   $LANG_PROJECT_ROOT/bin || exit 1

cp $LANG_PROJECT_ROOT/33_spu/src/$xxx/spu.dll \
   $LANG_PROJECT_ROOT/bin || exit 1

cp $LANG_PROJECT_ROOT/37_tacsim/src/$xxx/tacsim.dll \
   $LANG_PROJECT_ROOT/bin || exit 1

cp $LANG_PROJECT_ROOT/38_printf_chk/src/$xxx/printf_chk.dll \
   $LANG_PROJECT_ROOT/bin || exit 1

cp $LANG_PROJECT_ROOT/39_docgen/src/$xxx/docgen.dll \
   $LANG_PROJECT_ROOT/bin || exit 1

cp $LANG_PROJECT_ROOT/39_docgen/doclink/$xxx/doclink.exe \
   $LANG_PROJECT_ROOT/bin || exit 1
   
cp $LANG_PROJECT_ROOT/21_hcxx1/src/$xxx/hcxx1.exe \
   $LANG_PROJECT_ROOT/bin || exit 1

cp $LANG_PROJECT_ROOT/30_intel/src/"$xxx"CXX/intel.dll \
   $LANG_PROJECT_ROOT/bin/intelxx.dll || exit 1

cp $LANG_PROJECT_ROOT/31_sparc/src/"$xxx"CXX/sparc.dll \
   $LANG_PROJECT_ROOT/bin/sparcxx.dll || exit 1

cp $LANG_PROJECT_ROOT/32_ppc/src/"$xxx"CXX/ppc.dll \
   $LANG_PROJECT_ROOT/bin/ppcxx.dll || exit 1

cp $LANG_PROJECT_ROOT/33_spu/src/"$xxx"CXX/spu.dll \
   $LANG_PROJECT_ROOT/bin/spuxx.dll || exit 1

cp $LANG_PROJECT_ROOT/37_tacsim/src/"$xxx"CXX/tacsim.dll \
   $LANG_PROJECT_ROOT/bin/tacsimxx.dll || exit 1

cp $LANG_PROJECT_ROOT/38_printf_chk/src/"$xxx"CXX/printf_chk.dll \
   $LANG_PROJECT_ROOT/bin/printf_chkxx.dll || exit 1

cp $LANG_PROJECT_ROOT/39_docgen/src/"$xxx"CXX/docgen.dll \
   $LANG_PROJECT_ROOT/bin/docgenxx.dll || exit 1
   
