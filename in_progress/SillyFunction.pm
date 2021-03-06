#!/usr/bin/perl
# vim: set expandtab tabstop=4 shiftwidth=4 autoindent smartindent:
#
#
# Instructions
#
# 1. Figure out what this function does
#
# If the function was written well and/or documented to a decent standard, one
# would not have to make the effort.  I hate stupid tests like this.  THey
# show ernormous disrespect for the people who bother to respond to your
# position requirements.  "we have written something CLEVER and CRYPTIC.
# Now you can waste your time figuring it out.
#
# 2. Write a unit test for it
# 3. Refactor for readability and efficiency
#
# NOTE: Do regular commits that show agile style iterations through the problem.
# If you prefer a different language, you can provide your solution in PHP, 
# Python or Javascript too.
#
package SillyFunction;


# turn on some error trapping initially at least.

use strict;
use warnings;

# use the Dumper to have a look at the way this thing treats data
# fed to it

use Data::Dump qw(dump);

sub group_products {

# the name of this method is incorrect.  without modifying the algorithm
# enclosed in this code, it does not "GROUP" anything, not in the
# traditional sense of the word anyway.  It ORDERs by BRAND in a rather round-about way.
#
# I have a strong suspicion that the algorithm coded may not be doing what 
# was intended.  However, since I have no specification as to WHAT is required,
# to refactor it to do something else would be out of scope.


my $products = shift;
my %brand_type = ();
my $grouped_products = [];

# the initial reverse engineering of this mess is to first find out
# what sort of data it likes to eat.  I have a general idea, but
# we need to test those assumptions.
#
# This is clearly a method that sorts data elements into some
# sort of order.  Forensics will tell us what the data MAY look
# like.  As with all un-stated algorithms, there is likely to
# be MORE than one solution.  This is a stupid way of doing
# software engineering.



print "\n -----------products-------------------\n";
print dump($products);

foreach (@{$products}) {
    print "\n --------- --------------------\n";
    print dump($_);
    $brand_type{$_->{brand}} ||= {};
    $brand_type{$_->{brand}}->{$_->{type}} = 1;         # de-reference type
}

print "\n ------------------brand type------------\n";
print dump(%brand_type);

foreach (sort keys %brand_type) {
    my $brand = $_;
    print "\n --------------brand----------------\n";
    print dump($brand);
    foreach (sort keys %{$brand_type{$brand}}) {
        print "\n==================\n";
        print dump($_);
        print "\n==================\n";
        push(@{$grouped_products}, { brand => $brand, type => $_});
    }
}


print "\n ---------grouped products---------------------\n";
print dump($grouped_products);
print "\n ------------------------------\n";
}

1;
