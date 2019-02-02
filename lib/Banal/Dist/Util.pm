use 5.014;  # because we use the 'state' and  'non-destructive substitution' feature (s///r)
use strict;
use warnings;

package Banal::Dist::Util;
# vim: set ts=2 sts=2 sw=2 tw=115 et :
# ABSTRACT: General purpose utility collection mainly used by <Dist::Zilla::*::Author::TABULO>
# KEYWORDS: author utility

our $VERSION = '0.005';
# AUTHORITY


use Path::Tiny        qw(path);
use Data::Printer;                  # DEBUG aid.

use Exporter::Shiny qw( pause_config );

use namespace::autoclean;


# return username, password from ~/.pause
sub pause_config_alt  # Hmmm. We've got a similar named routine in *::Pause.pm
{
    my $file = path($ENV{HOME} // 'oops', '.pause');
    return if not -e $file;

    my ($username, $password) = map {
        my (undef, $val) = split ' ', $_; $val  # awk-style whitespace splitting
    } $file->lines;
}







1;

__END__
