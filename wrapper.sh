#! /bin/csh -vxf

echo "pid : $$"

setenv LANG C

set date1 = `date +%m.%d.%H.%M`
echo $date1

#cd $LANG_PROJECT_ROOT/41_ISO_IEC_9899
#verif.sh >& ~/garbage/41_ISO_IEC_9899.log.gxx.$date1
#pass_count.pl ~/garbage/41_ISO_IEC_9899.log.gxx.$date1
#filter.pl sh_known_bug gcc_known_bug > sh_known_bug.filter
#sh sh_known_bug.filter ~/garbage/41_ISO_IEC_9899.log.gxx.$date1 > ~/garbage/41_ISO_IEC_9899.log.gxx.$date1.filtered
#echo ~/garbage/41_ISO_IEC_9899.log.gxx.$date1.filtered

cd $LANG_PROJECT_ROOT/53_GNU_tool/gcc_cross/SH/test
verif.sh >& ~/garbage/SH.log.$date1
pass_count.pl ~/garbage/SH.log.$date1

exit

cd $LANG_PROJECT_ROOT/42_C2nd
verif.sh >& ~/garbage/42_C2nd.log.gxx.$date1
pass_count.pl ~/garbage/42_C2nd.log.gxx.$date1

set date2 = `date +%m.%d.%H.%M`
echo $date2

cd $LANG_PROJECT_ROOT/43_ISO_IEC_14882
verif.sh >& ~/garbage/43_ISO_IEC_14882.log.gxx.$date2
pass_count.pl ~/garbage/43_ISO_IEC_14882.log.gxx.$date2

date +%m.%d.%H.%M

