use 5.008008;
use strict;
use warnings;

use ExtUtils::MakeMaker;

my $EUMM_VERSION = eval($ExtUtils::MakeMaker::VERSION);

my $META_MERGE = {
    resources => {
        repository => 'https://github.com/chocolateboy/App-Wax',
        bugtracker => 'https://github.com/chocolateboy/App-Wax/issues',
    },
};

my $TEST_REQUIRES = {
    'Test::Differences' => '0.64',

    # the latest version (0.05) is not available:
    # https://github.com/sukria/Test-TinyMocker/issues/8
    'Test::TinyMocker' => '0.03',
};

WriteMakefile(
    ABSTRACT_FROM  => 'lib/App/Wax.pod',
    AUTHOR         => 'chocolateboy <chocolate@cpan.org>',
    EXE_FILES      => ['bin/wax'],
    NAME           => 'App::Wax',
    VERSION_FROM   => 'bin/wax',
    PREREQ_PM      => {
        'Digest::SHA'                => '0',
        'File::BaseDir'              => '0.07',
        'File::Slurper'              => '0.012',
        'IPC::System::Simple'        => '1.25',
        'LWP'                        => '6.31',
        'Method::Signatures::Simple' => '1.07',
        'MIME::Types'                => '2.17',
        'Mouse'                      => 'v2.5.2',
        'Parallel::parallel_map'     => '0.02',
        'Try::Tiny'                  => '0.30',
        'URI'                        => '1.73',
        'version'                    => '0.77',
    },
    ($EUMM_VERSION >= 6.5503 ? (BUILD_REQUIRES => $TEST_REQUIRES) : ()),
    ($EUMM_VERSION >= 6.31 ? (LICENSE => 'artistic_2') : ()),
    ($EUMM_VERSION >= 6.46 ? (META_MERGE => $META_MERGE) : ()),
    ($EUMM_VERSION >= 6.48 ? (MIN_PERL_VERSION => '5.8.8') : ()), # LWP's minimum
);
