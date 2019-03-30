#! /bin/csh -f

foreach dir ( $LANG_PROJECT_ROOT/10_hcpp/src \
              $LANG_PROJECT_ROOT/20_hcc1/src \
              $LANG_PROJECT_ROOT/21_hcxx1/src \
              $LANG_PROJECT_ROOT/30_intel/src \
              $LANG_PROJECT_ROOT/31_sparc/src \
	      $LANG_PROJECT_ROOT/32_ppc/src \
	      $LANG_PROJECT_ROOT/33_spu/src \
	      $LANG_PROJECT_ROOT/37_tacsim/src \
	      $LANG_PROJECT_ROOT/38_printf_chk/src \
	      $LANG_PROJECT_ROOT/39_docgen/src \
	      $LANG_PROJECT_ROOT/39_docgen/doclink \
           )
    pushd $dir

    if ($?BATCH_BUILD_VS_CLEAN) then
      MSBuild.exe /p:Configuration=Debug\;Platform=x64 /t:clean
      MSBuild.exe /p:Configuration=Release\;Platform=x64 /t:clean
      MSBuild.exe /p:Configuration=Debug\;Platform=x86 /t:clean
      MSBuild.exe /p:Configuration=Release\;Platform=x86 /t:clean
    else if ($BATCH_BUILD_VS_X86) then
      MSBuild.exe /p:Configuration=$BATCH_BUILD_VS_CONFIGURATION\;Platform=x86 || exit 1
    else
      MSBuild.exe /p:Configuration=$BATCH_BUILD_VS_CONFIGURATION\;Platform=x64 || exit 1
    endif
    endif

    popd
end

foreach dir ( $LANG_PROJECT_ROOT/30_intel/src \
              $LANG_PROJECT_ROOT/31_sparc/src \
	      $LANG_PROJECT_ROOT/32_ppc/src \
	      $LANG_PROJECT_ROOT/33_spu/src \
	      $LANG_PROJECT_ROOT/37_tacsim/src \
	      $LANG_PROJECT_ROOT/38_printf_chk/src \
	      $LANG_PROJECT_ROOT/39_docgen/src \
           )

    pushd $dir
    if ($?BATCH_BUILD_VS_CLEAN) then
      MSBuild.exe /p:Configuration=DebugCXX\;Platform=x64 /t:clean
      MSBuild.exe /p:Configuration=ReleaseCXX\;Platform=x64 /t:clean
      MSBuild.exe /p:Configuration=DebugCXX\;Platform=x86 /t:clean
      MSBuild.exe /p:Configuration=ReleaseCXX\;Platform=x86 /t:clean
    else if ($BATCH_BUILD_VS_X86) then
      MSBuild.exe /p:Configuration="$BATCH_BUILD_VS_CONFIGURATION"CXX\;Platform=x86 || exit 1
    else
      MSBuild.exe /p:Configuration="$BATCH_BUILD_VS_CONFIGURATION"CXX\;Platform=x64 || exit 1
    endif
    endif
    popd
end    
