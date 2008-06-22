##############################################################################
#      $URL$
#     $Date$
#   $Author$
# $Revision$
##############################################################################

package Perl::Critic::Policy::Miscellanea::ProhibitFormats;

use 5.006001;
use strict;
use warnings;
use Readonly;

use Perl::Critic::Utils qw{ :severities :classification };
use base 'Perl::Critic::Policy';

our $VERSION = '1.087';

#-----------------------------------------------------------------------------

Readonly::Scalar my $DESC => q{Format used};
Readonly::Scalar my $EXPL => [ 449 ];

#-----------------------------------------------------------------------------

sub supported_parameters { return ()                         }
sub default_severity     { return $SEVERITY_MEDIUM           }
sub default_themes       { return qw( core maintenance pbp ) }
sub applies_to           { return 'PPI::Token::Word'         }

#-----------------------------------------------------------------------------

sub violates {
    my ( $self, $elem, undef ) = @_;
    return if $elem ne 'format';
    return if ! is_function_call( $elem );
    return $self->violation( $DESC, $EXPL, $elem );
}


1;

__END__

#-----------------------------------------------------------------------------

=pod

=head1 NAME

Perl::Critic::Policy::Miscellanea::ProhibitFormats - Do not use C<format>.

=head1 AFFILIATION

This Policy is part of the core L<Perl::Critic> distribution.


=head1 DESCRIPTION

Formats are one of the oldest features of Perl.  Unfortunately, they suffer
from several limitations.  Formats are static and cannot be easily defined
at run time.  Also, formats depend on several obscure global variables.

For more modern reporting tools, consider using one of the template frameworks
like L<Template> or try the L<Perl6::Form> module.


=head1 CONFIGURATION

This Policy is not configurable except for the standard options.


=head1 AUTHOR

Jeffrey Ryan Thalhammer <thaljef@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2005-2008 Jeffrey Ryan Thalhammer.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.  The full text of this license
can be found in the LICENSE file included with this module.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=78 ft=perl expandtab shiftround :
