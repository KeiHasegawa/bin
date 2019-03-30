#! /usr/bin/env perl

$pass = 0;
$diff = 0;
$kill = 0;
$hcc1 = 0;
$hcxx1 = 0;
$gcc = 0;
$other = 0;

while ( <> ){
    chop;
    if ( /^wdog.exe -v diff/ ){
	$_ = <>;
	chop;
	++$pass if ( /^touch/ );
    }
    if ( /^wdog :/ || /^wdog.exe :/ ){
	if ( /diff/ ) {
	    ++$diff;
	}
	elsif ( /was killed by wdog/ ){
	    ++$kill;
	}
	elsif ( /hcc1.exe/ ){
	    ++$hcc1;
	}
	elsif ( /hcxx1.exe/ ){
	    ++$hcxx1;
	}
	elsif ( /gcc/ || /g\+\+/ ){
	    ++$gcc;
	}
	else {
	    ++$other;
	}
    }
    ++$pass if ( /^touch .*\.s/ );  # for printf_chk.dll
}

$fail = $diff + $kill + $hcc1 + $hcxx1 + $gcc + $other;

print "pass = ", $pass,"\n";
print "fail = ", $fail,"\n";
if ( $fail != 0 ){
print "  diff = ", $diff,"\n";
print "  kill = ", $kill,"\n";
print "  hcc1 = ", $hcc1,"\n";
print "  hcxx1= ", $hcxx1,"\n";
print "  gcc  = ", $gcc,"\n";
print "  other= ", $other,"\n";
}
print "------------\n";
print "total = ", $pass + $fail, "\n";
