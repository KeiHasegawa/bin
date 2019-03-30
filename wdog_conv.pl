#! /usr/bin/env perl

#$OPT = 'CC1_FLAG = --generator-option \( --debug --ms \)';

#$XXX = ;

while (<>) {
    chop;
    s/wdog : \/cygdrive\/d/cd d:/;
    s/wdog.exe :/cd/;
    if ( /(.*):diff (.*).log .*/ ) {
	print $1, "; rm -f ", $2, ".i ; make ", $2, ".lof", "\n";
	next;
    }
    if ( /(.*):.\/(.*).exe/ ) {
	print $1, "; rm -f ", $2, ".i ; make ", $2, ".lof", "\n";
	next;
    }
    if ( /(.*):hcc1.exe -o (.*)\.s / ) {
	print $1, "; rm -f ", $2, ".i ; make ", $2, ".lof", "\n";
	next;
    }
    if ( /(.*):hcxx1.exe -o (.*)\.s / ) {
	print $1, "; rm -f ", $2, ".i ; make ", $2, ".lof", "\n";
	next;
    }
    if ( /(.*):gcc -g -o (.*)\.exe / ) {
	print $1, "; rm -f ", $2, ".i ; make ", $2, ".lof", "\n";
	next;
    }
    print $_, "\n";
}

