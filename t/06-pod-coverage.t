#!perl -T

use strict;
use warnings;

use Test::More;

eval 'use Test::Pod::Coverage 1.08';
plan skip_all => 'Test::Pod::Coverage 1.08 required' if $@;

eval 'use Pod::Coverage 0.18';
plan skip_all => 'Pod::Coverage 0.18 required' if $@;

all_pod_coverage_ok();
