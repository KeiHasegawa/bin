#! /usr/bin/env perl

while ( <> ) {
    chop;
    if (/ error /) {
	print $_, "\n";
    }
}
