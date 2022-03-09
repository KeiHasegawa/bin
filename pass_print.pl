#! /usr/bin/env perl

while ( <> ){
    chop;
    if ( /Entering directory [\'`](.*)\'/ ) {
       $dir = $1;
    }
    if ( /wdog.exe -v diff/ || /^PASS/ ){
	$_ = <>;
	chop;
	if ( /^touch (.*)/ ){
	    print $dir,"/",$1,"\n";
	}
    }
}
