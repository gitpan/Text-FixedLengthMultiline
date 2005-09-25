#!/usr/bin/perl

require 5.6.0;
use utf8;
use Module::Build;
my $build = Module::Build->new(
	module_name => 'Text::FixedLengthMultiline',
	# I hope one day YAML.pm will correctly encode using UTF-8
	#dist_author => 'Olivier Mengué <dolmen@cpan.org>',
	dist_author => 'Olivier Mengue <dolmen@cpan.org>',
	license => 'perl',
	requires => {
		'perl' => '5.6.0'
	},
	create_readme => 1
);
$build->create_build_script;
