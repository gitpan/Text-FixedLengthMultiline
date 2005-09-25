#perl -T

use strict;
use warnings;
use Test::More tests => 13;

BEGIN { use_ok('Text::FixedLengthMultiline'); }

my $fmt = new Text::FixedLengthMultiline(format => ['col1' => 10]);
isa_ok($fmt, 'Text::FixedLengthMultiline');

foreach (('first', 'any', 'last')) {
    undef $fmt;
    $fmt = new Text::FixedLengthMultiline(format => ['col1' => 10], continue_style => $_);
    isa_ok($fmt, 'Text::FixedLengthMultiline');
}

## Check for failures ##

eval { $fmt = new Text::FixedLengthMultiline(); };
like($@, qr|^\Q[Text::FixedLengthMultiline] Missing format\E|, 'Exception for invalid format');

foreach ((3, 'zzz', { })) {
    eval { $fmt = new Text::FixedLengthMultiline(format => $_); };
    like($@, qr|^\Q[Text::FixedLengthMultiline] Invalid format: array ref expected\E|, "Exception for invalid format: $_");
}

foreach ((3, 'zzz', [ ], { } )) {
    eval { $fmt = new Text::FixedLengthMultiline(format => [ "col1" => 10 ], continue_style => $_); };
    like($@, qr|^\Q[Text::FixedLengthMultiline] Invalid continue_style: first/last/any expected\E|, "Exception for invalid continue_style: $_");
}


