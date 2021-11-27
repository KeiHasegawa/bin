#! /bin/csh -vxf

echo "pid : $$"

setenv LANG C

set date1 = `date +%m.%d.%H.%M`
echo $date1

cd $LANG_PROJECT_ROOT/41_ISO_IEC_9899
verif.sh >& /tmp/41_ISO_IEC_9899.log.gxx.$date1
pass_count.pl /tmp/41_ISO_IEC_9899.log.gxx.$date1
filter.pl sh_known_bug gcc_known_bug > sh_known_bug.filter
sh sh_known_bug.filter /tmp/41_ISO_IEC_9899.log.gxx.$date1 > /tmp/41_ISO_IEC_9899.log.gxx.$date1.filtered
echo /tmp/41_ISO_IEC_9899.log.gxx.$date1.filtered

exit

cd $LANG_PROJECT_ROOT/42_C2nd
verif.sh >& /tmp/42_C2nd.log.gxx.$date1
pass_count.pl /tmp/42_C2nd.log.gxx.$date1

set date2 = `date +%m.%d.%H.%M`
echo $date2

cd $LANG_PROJECT_ROOT/43_ISO_IEC_14882
verif.sh >& /tmp/43_ISO_IEC_14882.log.gxx.$date2
pass_count.pl /tmp/43_ISO_IEC_14882.log.gxx.$date2

date +%m.%d.%H.%M

