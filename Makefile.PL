use 5.006;

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME               => 'Biblio::Refbase',
  AUTHOR             => 'Henning Manske <hma@cpan.org>',
  VERSION_FROM       => 'lib/Biblio/Refbase.pm',
  ABSTRACT_FROM      => 'lib/Biblio/Refbase.pm',
  ($ExtUtils::MakeMaker::VERSION >= 6.3002 ? ( LICENSE => 'perl') : ()),
  PL_FILES           => {},
  PREREQ_PM => {
    'Carp'                  => 0,
    'HTTP::Request::Common' => 0,
    'HTTP::Status'          => 0,
    'LWP::UserAgent'        => 0,
    'URI'                   => 0,
    'URI::QueryParam'       => 0,
    'Test::More'            => 0,
  },
  dist               => { COMPRESS => 'gzip -9f', SUFFIX => 'gz' },
  clean              => { FILES => 'Biblio-Refbase-*' },
);
