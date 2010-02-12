package Cellucidate;

use 5.008009;
use Cellucidate::Request;
use Cellucidate::Bookshelf;
use Cellucidate::Book;
use Cellucidate::Model;
use Cellucidate::ModelRule;
use Cellucidate::InitialCondition;
use Cellucidate::SimulationRun;
use Cellucidate::Plot;
use Cellucidate::Series;
use Cellucidate::Job;
use Cellucidate::License;

use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Cellucidate ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

our $VERSION = '0.01';


# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Cellucidate - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Cellucidate;

  # Search for a bookshelf, returns an array of bookshelf hashes
  $bookshelves = Cellucidate::Bookshelf->find();
  $bookshelves = Cellucidate::Bookshelf->find( { name => 'Reference 10' });

  # Single bookshelf
  $bookshelf = Cellucidate::Bookshelf->show(102);

  # Bookshelf properties
  $bookshelf->{id}   # => 102
  $bookshelf->{name} # => 'Reference 10'


  # Search for books
  $books = Cellucidate::Bookshelf->find();
  $bookshelf->books();


  # Single book  

  # Search for models
  $models = Cellucidate::Model->find( ... );

  # Single model
  $model = Cellucidate::Model->show( id );

  $model->model_rules();

  model_id => $model->{id}

  # Single model_rules
  $model_rules = Cellucidate::ModelRule->show( id );


  # Simulation Run
  
  $params = {
    "num_iterations" => 3
  };

  $simulation_run = Cellucidate::SimulationRun->create($params);
  $simulation_run->state; #is it still running?

  $plots = $simulation_run->plots();  # Cellucidate::Plot->find( { simulation_run_id => $id } );

  /plots/1 (/plots1.xml) => metadata
  /plots/1.csv => Dump of CSV data


=head1 DESCRIPTION

Stub documentation for Cellucidate, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Brian Kaney, E<lt>bkaney@hsd1.ma.comcast.net.E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Brian Kaney

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.9 or,
at your option, any later version of Perl 5 you may have available.


=cut
