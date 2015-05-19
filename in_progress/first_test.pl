#!/usr/bin/perl

# vim: set expandtab tabstop=4 shiftwidth=4 autoindent smartindent:

use strict;                 # turn on some error trapping at least
use warnings;

use SillyFunction;          # this is the supplied function to reverse engineer
use Data::Dump qw(dump);    # data dumper used occasionally to examine structures

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
        {brand  => "Apple",             type => "1"},
        {brand  => "Tomato",            type => "1"},
        {brand  => "Pear",              type => "1"},
        {brand  => "Orange",            type => "1"},
        {brand  => "Grape",             type => "2"},
        {brand  => "Kiwi",              type => "3"},
        {brand  => "Cumquat",           type => "4"},
        {brand  => "Grapefruit",        type => "5"});


    # this next line does EXACTLY the same thing as the entire Package

    my @sorted = sort { $a->{brand} cmp $b->{brand} } @products;


    print dump(SillyFunction::group_products(\@products));

# here is a program execution trace of this run.  I am sure it is
# not doing what the author possibly intended it to do.

# 
#  -----------products-------------------
# [
#   { brand => "Apple", type => 1 },
#   { brand => "Tomato", type => 1 },
#   { brand => "Pear", type => 1 },
#   { brand => "Orange", type => 1 },
#   { brand => "Grape", type => 2 },
#   { brand => "Kiwi", type => 3 },
#   { brand => "Cumquat", type => 4 },
#   { brand => "Grapefruit", type => 5 },
# ]
#  --------- --------------------
# { brand => "Apple", type => 1 }
#  --------- --------------------
# { brand => "Tomato", type => 1 }
#  --------- --------------------
# { brand => "Pear", type => 1 }
#  --------- --------------------
# { brand => "Orange", type => 1 }
#  --------- --------------------
# { brand => "Grape", type => 2 }
#  --------- --------------------
# { brand => "Kiwi", type => 3 }
#  --------- --------------------
# { brand => "Cumquat", type => 4 }
#  --------- --------------------
# { brand => "Grapefruit", type => 5 }
#  ------------------brand type------------
# (
#   "Kiwi",
#   { 3 => 1 },
#   "Pear",
#   { 1 => 1 },
#   "Cumquat",
#   { 4 => 1 },
#   "Grape",
#   { 2 => 1 },
#   "Grapefruit",
#   { 5 => 1 },
#   "Tomato",
#   { 1 => 1 },
#   "Apple",
#   { 1 => 1 },
#   "Orange",
#   { 1 => 1 },
# )
#  --------------brand----------------
# "Apple"
# ==================
# 1
# ==================
# 
#  --------------brand----------------
# "Cumquat"
# ==================
# 4
# ==================
# 
#  --------------brand----------------
# "Grape"
# ==================
# 2
# ==================
# 
#  --------------brand----------------
# "Grapefruit"
# ==================
# 5
# ==================
# 
#  --------------brand----------------
# "Kiwi"
# ==================
# 3
# ==================
# 
#  --------------brand----------------
# "Orange"
# ==================
# 1
# ==================
# 
#  --------------brand----------------
# "Pear"
# ==================
# 1
# ==================
# 
#  --------------brand----------------
# "Tomato"
# ==================
# 1
# ==================
# 
#  ---------grouped products---------------------
# [
#   { brand => "Apple", type => 1 },
#   { brand => "Cumquat", type => 4 },
#   { brand => "Grape", type => 2 },
#   { brand => "Grapefruit", type => 5 },
#   { brand => "Kiwi", type => 3 },
#   { brand => "Orange", type => 1 },
#   { brand => "Pear", type => 1 },
#   { brand => "Tomato", type => 1 },
# ]
#  ------------------------------

