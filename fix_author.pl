#!/usr/bin/env perl

use strict;
use warnings;
use autodie qw(open close);
use Carp qw(croak);

open my $fh, '<', $ARGV[0];

while(<$fh>){
	#if (/author =[ ]+\".*\n*/m){
	if (/\.\"\,$/){
		s/\.\"\,$/\"\,/ unless /journal/;
		print $_;	
	}
	else{ 
		print $_;
	}
}	

