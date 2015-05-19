#!/usr/bin/perl

use strict;					# turn on some error trapping at least
use warnings;

use SillyFunction;			# this is the supplied function to reverse engineer
use Data::Dump qw(dump);	# data dumper used occasionally to examine structures

# A stupid coding test.  You are given a badly written Perl function
# with no imput or output rquirements or expectations and the HR
# department sits back smugly actually thinking that the 
# test actually means something.....

# first thing to do is feed the thing some data and see what the
# package does or does not do.

# most of these are obviously incorrect, however I want to get an idea
# what the package will do with different types of data
# since these are forenscic hacks, there is really no need to write
# them with a lot of panache.  comment in and out as we collect responses.

	# my $products = "Acer 1 Toshiba 1 Envy 1 Thinkpad 1 Lenova 2 iPad 3 Chromebook 4 Kindle 5";
	# my @products = ("Acer", "1", "Toshiba", "1", "Envy", "1", "Thinkpad", "1", "Lenova", "2", "iPad", "3", "Chromebook" "4", "Kindle", "5");
	# my %products = ("Acer", "1", "Toshiba", "1", "Envy", "1", "Thinkpad", "1", "Lenova", "2", "iPad", "3", "Chromebook" "4", "Kindle", "5");

	# feed the beast

	# print dump(group_products($products));
	# print dump(group_products(@products));
	# print dump(group_products(%products));

	# no real reason to leave in the above crap.  However, since this is a test,
	# perhaps teacher may want to see my "working out"


	my @products = (
		{brand	=> "Acer", 			type => "1"},
		{brand	=> "Toshiba", 		type => "1"},
		{brand	=> "Envy", 			type => "1"},
		{brand	=> "Thinkpad", 		type => "1"},
		{brand	=> "Lenova", 		type => "2"},
		{brand	=> "iPad", 			type => "3"},
		{brand	=> "Chromebook",	type => "4"},
		{brand	=> "Kindle", 		type => "5"});

	
	# print dump(group_products(@products));
	# nope

	print dump(SillyFunction::group_products(\@products));

	# yep


