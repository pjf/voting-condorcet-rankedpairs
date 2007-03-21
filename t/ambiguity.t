#!/usr/bin/perl -w
use strict;
use Test::More tests => 4;

use Voting::Condorcet::RankedPairs;

my $rp = Voting::Condorcet::RankedPairs->new;

# A simple test taken directly from Wikipedia.
# Here we have circular preferences.  The graph
# should be created in the following order:
#
# B -> C	(strongest majority)
# A -> B
# C -> A	(not inserted, would cause a cyle)

# Hence A is first.  B is second.  C is third.

$rp->add('A' => 'B', 0.68);
$rp->add('B' => 'C', 0.72);
$rp->add('C' => 'A', 0.52);

is($rp->winner,"A","Circular test");

# In the third of our tests here, we should see that only B beats
# C.  Even though 'A' has placed first, they were an (insignificant)
# underdog to C in the pairwise matches.

is_deeply([$rp->better_than('A')],[],"Nobody's better than A");
is_deeply([$rp->better_than('B')],['A'],"A bets B");
is_deeply([$rp->better_than('C')],['B'],"Only B beats C.");
