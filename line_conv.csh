#! /bin/csh -vxf

sed -e 's/a\.s:[0-9]*/a.s:XX/' -e 's/b\.s:[0-9]*/b.s:XX/' \
$argv[1] > $argv[1].$$
mv $argv[1].$$ $argv[1]

