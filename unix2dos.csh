#! /bin/csh -f

sed -e 's/$/\r/' $argv[1] > $argv[1].$$
mv $argv[1].$$ $argv[1]
