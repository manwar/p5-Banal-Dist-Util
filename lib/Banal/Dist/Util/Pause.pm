use 5.014;  # because we use the 'state' and  'non-destructive substitution' feature (s///r)
use strict;
use warnings;

package Banal::Dist::Util::Pause;
# vim: set ts=2 sts=2 sw=2 tw=115 et :
# ABSTRACT: General purpose utility collection for <Dist::Zilla::*::Author::TABULO>
# KEYWORDS: author utility

our $VERSION = '0.001';
# AUTHORITY

use Path::Tiny;
use namespace::autoclean;

use Exporter::Shiny qw(
  pause_config
);

# return username, password from ~/.pause
sub pause_config
{
#     my $home = $ENV{HOME};
#     return unless defined $home;
#     my $file = path($home, '.pause')->realpath;
# #    my $file = path('~/.pause')->realpath;
#     return unless $file->exists();

    my %r;
FILE:
    foreach my $fname (qw(~/.pause ~/.pause.conf)) {
      my $file = path($fname)->realpath;
      next FILE unless $file->exists;
LINE:
      foreach ( $file->lines(chomp=>1) ) {
KEY:
        foreach my $key (qw(user password)) {
          m/^\s*${key}\s*(\s|[=])\s*(\S+)/     and do { $r{$key} = $1; next };
        }
      }
    }

    wantarray ? (%r) : \%r;
}



1;

__END__
