#!perl -T

use strict;
use warnings;

use Test::More 0.62 tests => 1;

use Biblio::Refbase;

my $refbase = eval { Biblio::Refbase->new };

isa_ok $refbase, 'Biblio::Refbase'
  or BAIL_OUT q{Can't create a Biblio::Refbase object};
