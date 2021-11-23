#! /bin/csh -f

find . -name '*.hcc1_only' -exec takeoff {} \;
find . -name '*.intel' -exec takeoff {} \;
find . -name '*.enough_memory' -exec takeoff {} \;
find . -name \*.INT_TYPE_SIZE_32 -exec overwrite {} \;
find . -name \*.LONG_TYPE_SIZE_32 -exec overwrite {} \;
find . -name \*.POINTER_SIZE_32 -exec overwrite {} \;
find . -name \*.POINTERS_EXTEND_UNSIGNED_0 -exec overwrite {} \;
find . -name \*.PTRDIFF_TYPE_int -exec overwrite {} \;
find . -name \*.DEFAULT_SIGNED_CHAR_1 -exec overwrite {} \;
find . -name \*.WCHAR_TYPE_long -exec overwrite {} \;
find . -name \*.DOUBLE_TYPE_SIZE_64 -exec overwrite {} \;
find . -name \*.LONG_DOUBLE_TYPE_SIZE_64 -exec overwrite {} \;
find . -name \*.gcc -exec overwrite {} \;
find . -name \*.sh -exec overwrite {} \;
find . -name '*.conly' -exec overwrite {} \;

if ($cwd == $LANG_PROJECT_ROOT/41_ISO_IEC_9899) then 
   rm -f 6_Language/1_Lexical_elements/2_Identifiers/6_Compatible_type_and_composite_type/2_error/test000.c
endif

make clean
make -k 'MY_MAKEFLAGS=-k'
