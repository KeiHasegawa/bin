#! /bin/csh -vxf

sed -e 's/.text+0x[0-9a-f]\+/.text+0xXX/' $argv[1] > $argv[1].$$
mv $argv[1].$$ $argv[1]

