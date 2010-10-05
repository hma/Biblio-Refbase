#!perl
#
#  xt/author/kwalitee.t 0.01 hma Sep 16, 2010
#
#  Test the Kwalitee of a distribution before you release it
#  RELEASE_TESTING only
#

use strict;
use warnings;

#  adopted Best Practice for Author Tests, as proposed by Adam Kennedy
#  http://use.perl.org/~Alias/journal/38822

BEGIN {
  if (my $msg =
      ! $ENV{RELEASE_TESTING}       ? 'Author tests not required for installation'
    : $] >= 5.008 &&  ${^TAINT} > 0 ? 'This test does not run in taint mode'
    : undef
  ) {
    require Test::More;
    Test::More::plan( skip_all => $msg );
  }
}

my %MODULES = (
  'Module::CPANTS::Analyse' => '0.85',
  'Test::Kwalitee'          => '1.01',
);

while (my ($module, $version) = each %MODULES) {
  $module .= ' ' . $version if $version;
  eval "use $module ()";
  die "Could not load required release testing module $module:\n$@" if $@;
}

Test::Kwalitee->import;
