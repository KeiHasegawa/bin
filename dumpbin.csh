#!/bin/csh -vxf

setenv VSCommonDir '/Program Files/Microsoft Visual Studio/Common'
setenv MSDevDir '/Program Files/Microsoft Visual Studio/Common/MSDev98'
setenv MSVCDir '/Program Files/Microsoft Visual Studio/VC98'
setenv VcOsDir WIN95
if ( "$OS" == "Windows_NT" ) then
  setenv VcOsDir WINNT
endif
if ( $OS == "Windows_NT" ) then
  setenv PATH "$PATH":"$MSDevDir/BIN"
  setenv PATH "$PATH":"$MSVCDir/BIN"
  setenv PATH "$PATH":"$VSCommonDir/TOOLS/VcOsDir"
  setenv PATH "$PATH":"$VSCommonDir/TOOLS"
endif

if ( $OS == "" ) then
  setenv PATH "$PATH":"$MSDevDir/BIN"
  setenv PATH "$PATH":"$MSVCDir/BIN"
  setenv PATH "$PATH":"$VSCommonDir/TOOLS/VcOsDir"
  setenv PATH "$PATH":"$VSCommonDir/TOOLS"
  setenv PATH "$PATH":"$windir/SYSTEM"
endif

setenv INCLUDE "$MSVCDir/ATL/INCLUDE"
setenv INCLUDE "$INCLUDE;$MSVCDir/INCLUDE"
setenv INCLUDE "$INCLUDE;$MSVCDir/MFC/INCLUDE"

setenv LIB "$MSVCDir/LIB"
setenv LIB "$LIB;$MSVCDir/MFC/LIB"

DUMPBIN.EXE /DISASM hcc1.exe
# Did you try objdump?
