#!perl
#
#  xt/author/module-used.t 0.02 hma Sep 23, 2010
#
#  Test required module is really used and vice versa bitween lib/t and META.yml
#  RELEASE_TESTING only
#

use strict;
use warnings;

#  adopted Best Practice for Author Tests, as proposed by Adam Kennedy
#  http://use.perl.org/~Alias/journal/38822

BEGIN {
  my $MIN_PERL = 5.008_003;
  if (my $msg =
      ! $ENV{RELEASE_TESTING} ? 'Author tests not required for installation'
    : $] < $MIN_PERL          ? "Perl $MIN_PERL required"
    : ${^TAINT} > 0           ? 'This test does not run in taint mode'
    : undef
  ) {
    require Test::More;
    Test::More::plan( skip_all => $msg );
  }
}

my %MODULES = (
  'Test::Module::Used' => '0.1.9',
);

while (my ($module, $version) = each %MODULES) {
  $module .= ' ' . $version if $version;
  eval "use $module ()";
  die "Could not load required release testing module $module:\n$@" if $@;
}

my $used = Test::Module::Used->new;

# the hacks for Kwalitee in xt/pod.t and xt/pod-coverage.t
# require these modules directly

$used->push_exclude_in_testdir( 'Test::Pod', 'Test::Pod::Coverage' );

$used->ok;
