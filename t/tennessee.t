#!/usr/bin/perl -w
use strict;
use Test::More 'no_plan';

# This example is from Wikipedia.
# http://en.wikipedia.org/wiki/Ranked_Pairs

use_ok("Voting::Condorcet::RankedPairs");

my $rp = Voting::Condorcet::RankedPairs->new;
isa_ok($rp,"Voting::Condorcet::RankedPairs");

$rp->add('Memphis'     => 'Nashville',   0.42);
$rp->add('Memphis'     => 'Chattanooga', 0.42);
$rp->add('Memphis'     => 'Knoxville',   0.42);
$rp->add('Nashville'   => 'Chattanooga', 0.68);
$rp->add('Nashville'   => 'Knoxville',   0.68);
$rp->add('Chattanooga' => 'Knoxville',   0.83);

is($rp->winner,'Nashville');
