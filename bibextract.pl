#!/usr/bin/env perl

use strict;
use warnings;
use Carp qw(croak);
use autodie qw(open close);
use File::Basename;
use List::MoreUtils qw(uniq);


croak "Usage: ./bibextract.pl tex_file.tex" unless defined $ARGV[0];

my $infile = $ARGV[0];

my $tex_file = $infile;
my $bib_filename = "/home/lina/texmf/bibtex/bib/biophymd.bib";
#my $bib_filename = "try.bib";
my $bib_abbrev_filename = "/home/lina/texmf/bibtex/bib/biophyabbrev.bib";
my $extracted_bib = basename("$infile",".tex");
   $extracted_bib .= "\.bib";

my $cited;
my @citeditems;
my @uciteditems;
my @items;
my $item;
my $reg ;
my $section_tex;
my $time = localtime;

open my $fho,'>',$extracted_bib;
## write some forewords to the output file, namely $extracted_bib
my $forewords = <<END;
%% '$extracted_bib' BibTex file.
%% generated with 'bibextract' on $time
%%
END
print $fho $forewords;

## read the bib abbrevision and save it to $extracted_bib file.


open my $fh4,'<',$bib_abbrev_filename;
while(<$fh4>){
	if (/^\@STRING\{/){
		print $fho $_;
	}
}


## read all the cited items from  input.tex file and save it to @citeditems

read_tex($tex_file);

open my $fh3, '<',$tex_file;
while (my $line = <$fh3>){
	if($line =~ /include\{(.+)\}/){
		$section_tex = $1;
		$section_tex .="\.tex";		
		
		read_tex($section_tex);
		
	}
}
close($fh3);


sub read_tex{
	open my $fh, '<', @_;
	while(<$fh>){
		if(/cite\{(.+?)\}/){
		push @citeditems,split/,/,$1;
		}
	}
	close($fh);
}

## read the .bib database and extract the cited out

@uciteditems = uniq @citeditems;
foreach $item (@uciteditems){
	match($item);
	}
	

sub match{

	open my $fh2, '<', $bib_filename;

	LINE: while(my $line = <$fh2>){

		if ($line =~ m/@_\,/ .. $line =~ /^\}$/){
			print $fho $line;
		#last;
		}
	

	}
	close($fh2);
}

close($fho);
