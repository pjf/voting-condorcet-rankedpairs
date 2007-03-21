#!/usr/bin/perl -w
use strict;
use Test::More tests => 1;

use Voting::Condorcet::RankedPairs;

my $rp = Voting::Condorcet::RankedPairs->new;

$rp->add('A' => 'B', 0.68);
$rp->add('B' => 'C', 0.72);
$rp->add('C' => 'A', 0.52);

is($rp->winner,"A","Circular test");
