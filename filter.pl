#! /usr/bin/env perl

print "sed \\\n";

while (<>) {
    chop;
    next if (/^#/);
    next if (/^$/);
    s/\//\./g;
    s/:/\.\*/g;
    print "-e /", $_, "/d \\\n";
}

print "\$1\n";
