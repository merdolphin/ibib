#!/usr/bin/env perl

use strict;
use warnings;
use autodie qw(open close);
use Carp qw(croak);
use 5.012;

open my $fh,"<","biophymd.bib";

while(my $line = <$fh>){
	if($line =~ /title =\s+"[A-Z]+\s+[A-Z]+/){
		print $line;
	}
} 
