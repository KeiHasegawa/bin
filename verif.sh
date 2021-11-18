#! /bin/csh -f

find . -name '*.hcc1_only' -exec takeoff {} \;
find . -name '*.intel' -exec takeoff {} \;
find . -name '*.enough_memory' -exec takeoff {} \;
find . -name \*.wchar_is_long -exec overwrite {} \;
find . -name \*.gcc -exec overwrite {} \;
find . -name \*.mlong -exec overwrite {} \;
find . -name \*.char_is_schar -exec overwrite {} \;
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
