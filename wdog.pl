#! /usr/bin/env perl

$dir = $ENV{"LANG_PROJECT_ROOT"};

$chop_prj_root = 0;

while ( <> ){
    chop $_;
    if ( /^wdog(\.exe)? : / ){
	if ($chop_prj_root) {
	    $tmp = $_;
	    $_ = $dir;
	    s/^d:/\/cygdrive\/d/;
	    $dir = $_;
	    $_ = $tmp;
	    s/.*$dir\/(.*)/$1/;
	}
	print $_,"\n";
    }
}
