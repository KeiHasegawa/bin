#! /bin/csh -f

find . -name '*.hcc1_only' -exec takeoff {} \;
find . -name '*.intel' -exec takeoff {} \;
find . -name '*.enough_memory' -exec takeoff {} \;
find . -name \*.gcc -exec overwrite {} \;
find . -name \*.INT_TYPE_SIZE_32 -exec overwrite {} \;
find . -name \*.POINTER_SIZE_32 -exec overwrite {} \;
find . -name \*.POINTERS_EXTEND_UNSIGNED_0 -exec overwrite {} \;
find . -name \*.DEFAULT_SIGNED_CHAR_1 -exec overwrite {} \;
find . -name \*.WCHAR_TYPE_unsigned_short -exec overwrite {} \;
find . -name \*.sh -exec overwrite {} \;
find . -name '*.conly' -exec overwrite {} \;

if ($cwd == $LANG_PROJECT_ROOT/41_ISO_IEC_9899) then 
   rm -f 6_Language/1_Lexical_elements/2_Identifiers/6_Compatible_type_and_composite_type/2_error/test000.c
endif

if (-f Makefile.ok.sh) then
  cp Makefile.ok.sh Makefile.ok
endif  
if (-f Makefile.error.sh) then
  cp Makefile.error.sh Makefile.error
endif
if (-f Makefile.ok2.sh) then
  cp Makefile.ok2.sh Makefile.ok2
endif
if (-f Makefile.error2.sh) then
  cp Makefile.error2.sh Makefile.error2
endif
if (-f Makefile.sh) then
  cp Makefile.sh Makefile
endif

make clean
make -k 'MY_MAKEFLAGS=-k'
