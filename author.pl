#!/usr/bin/env perl

use strict;
use warnings;
use autodie qw(open close);
use Carp qw(croak);
use 5.012;

my $str=$ARGV[0];
#"Duara R, Lopez-Alberola RF, Barker WW, Loewenstein DA, Zatinsky M, Eisdorfer CE, Weinberg GB";

my @a=split /\,/, $str;

foreach (@a){

	if (/([A-Z][a-z]+)[ ]([A-Z]+)/) {
	print join(". ",split('',$2)),"\. ", $1, " and ";
	}
}


print "\n";

my $authors =" Rissman, R.; Poon, W. W.; Blurton, M.; Oddo, S.; Torp, R.; Vitek, M.; LaFerla, F.; Rohn, T. T.";

#my @b = split /;/, $authors; 

#foreach (@b){
#	if (/([A-Z][a-z]+)\,[ ]([A-Z. ]+)/){
#		print $2," ", $1, " and ";
#	}
#}

print join ' and ', map {
	join ' ', reverse split /,\s*/;
} split /;\s*/, $authors;

print "\n\n\n";

my $authors2 = "Rammes, A., Roth, J., Goebeler, M., Klempt, M., Hartmann, M., Sorg, C. ";

my @author = split /\.\,/, $authors2;

foreach(@author){
	print join '. ', reverse split /\,/, $_;
	print " and ";
}
