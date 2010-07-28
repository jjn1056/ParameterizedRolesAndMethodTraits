#!/usr/bin/env perl

use strict;
use warnings;
use inc::Module::Install;

all_from 'lib/ParameterizedRolesAndMethodTraits.pod';
repository 'git://github.com/jjn1056/ParameterizedRolesAndMethodTraits.git';

my @core_requires = (
    'Moose' => '1.09',
    'MooseX::Declare' => '0.33',
    'MooseX::Role::Parameterized' => '0.19',
    'Scalar::Util' => '1.23',
);

requires @core_requires;

build_requires 'Test::More' => '0.94';
build_requires 'Test::Output' => '0.16';

auto_install;
WriteAll;
