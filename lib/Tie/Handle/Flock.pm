package Tie::Handle::Flock;

use warnings;
use strict;

require Tie::Handle;
our @ISA = qw(Tie::StdHandle);
our $VERSION = '0.01';

use Fcntl qw(:flock :seek);

# WRITE this, scalar, length, offset
sub WRITE {
	my $fh = shift;
	$fh->lock();
	$fh->SUPER::WRITE( @_ );
	$fh->unlock();
}

# PRINT this, LIST
sub PRINT {
	my $fh = shift;
	$fh->lock();
	$fh->SUPER::PRINT( @_ );
	$fh->unlock();
}

# PRINTF this, format, LIST
sub PRINTF {
	my $fh = shift;
	$fh->lock();
	$fh->SUPER::PRINTF( @_ );
	$fh->unlock();
}

sub lock {
	my ($fh) = @_;
	flock($fh, LOCK_EX);
	seek( $fh, 0, SEEK_END );
}

sub unlock {
	my ($fh) = @_;
	flock($fh, LOCK_UN);
}

__PACKAGE__
=head1 NAME

Tie::Handle::Flock - The great new Tie::Handle::Flock!

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Tie::Handle::Flock;

    my $foo = Tie::Handle::Flock->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Ivan Heffner, C<< <iheffne at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-tie-handle-flock at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Tie-Handle-Flock>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Tie::Handle::Flock


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Tie-Handle-Flock>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Tie-Handle-Flock>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Tie-Handle-Flock>

=item * Search CPAN

L<http://search.cpan.org/dist/Tie-Handle-Flock/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Ivan Heffner, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Tie::Handle::Flock