#!perl -T

use strict;
use warnings;

use Test::More 0.62 tests => 1;

BEGIN {
  use_ok 'Biblio::Refbase'
    or BAIL_OUT q{Can't load module};
}
