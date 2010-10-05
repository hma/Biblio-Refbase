#!perl -T
#
#  xt/author/strict.t 0.01 hma Sep 16, 2010
#
#  Check syntax, presence of use strict;
#  RELEASE_TESTING only
#

use strict;
use warnings;

#  adopted Best Practice for Author Tests, as proposed by Adam Kennedy
#  http://use.perl.org/~Alias/journal/38822

BEGIN {
  unless ($ENV{RELEASE_TESTING}) {
    require Test::More;
    Test::More::plan( skip_all => 'Author tests not required for installation' );
  }
}

my %MODULES = (
  'Test::Strict' => '0.14',
);

while (my ($module, $version) = each %MODULES) {
  $module .= ' ' . $version if $version;
  eval "use $module";
  die "Could not load required release testing module $module:\n$@" if $@;
}

{
  no warnings 'once';
  local $Test::Strict::TEST_WARNINGS = 1;

  all_perl_files_ok( '.' );
}
