#!perl -T
#
#  xt/author/checkchanges.t 0.01 hma Sep 16, 2010
#
#  Check that the Changes file matches the distribution
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
  'Test::CheckChanges' => '0.14',
);

while (my ($module, $version) = each %MODULES) {
  $module .= ' ' . $version if $version;
  eval "use $module";
  die "Could not load required release testing module $module:\n$@" if $@;
}


# untaint

my ($perl) = ($^X || 'perl') =~ /^(.*)$/;
local ($ENV{PATH}) = $ENV{PATH} =~ /^(.*)$/;

# make sure Makefile is up to date

my $out = `$perl Makefile.PL 2>&1`;
die "Could not make Makefile: $out" if $?;

# note: 'base' parameter is an undocumented feature of Test::CheckChanges
# required if this file resides one level deeper, e.g. in 'xt/author'

ok_changes( base => '..' );
