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
use Cellucidate::KappaImportJob;

use strict;
use warnings;

our $VERSION = '0.01';

our $CONFIG = {
    host => 'http://api.cellucidate.com'
};

our $AUTH = {
    'email' => 'user@cellucidate.com',
    'api_key' => '123456'
};


1;

__END__
=head1 NAME

Cellucidate - Perl library for cellucidate.com

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

Cellucidate is a tool for computation biologists to run simulations.  It is
centered around the Kappa language.

The various objects in Cellucidate are arranged into a book metaphor.  The basic
hierarchy is:

  Bookshelves
  `-> Books
      `-> Models
          `-> Model Rules
          `-> Initial Conditions
          `-> Simulation Runs
              `-> Plots
                  `-> Series

Additionally, there are a few resources for auxiluary tasks, like importing
data and running various jobs.

=head2 REST

Cellucidate has a RESTful interface.  So this library is built upon the 
L<REST::Client> library.  At the core, there are 4 operations over HTTP,
including: GET, POST, PUT and DELETE.  The encoding is primarily XML, but
certain resource can be returned in CSV.

=head2 COMMON METHODS / PATTERN

Around each resource, there are convience methods -

    find( { params }, format)
    get(id, format)
    update(id, { data }, format)
    create({ data }, format)

See each subclass for a list of specific methods and examples

=head1 SUBCLASSES

=over 4

=item L<Cellucidate::Base> Base class for each resrouce

=item L<Cellucidate::Bookshelf> 

Represents a Bookshelf in Cellucidate.  This is pretty much the top tier
of resources.

=item L<Cellucidate::Bookshelf>

Represents a Book in Cellucidate.  This is where Models live.  A book
can be placed on a Bookshelf and has many Models.

=item L<Cellucidate::Model> 

Represents a biological model in Cellucidate.  The model belongs to a book
and contains a number of Model Rules and Initial Conditions.  A number of
simulations can be run from a Model, each having a number of settings.

=item L<Cellucidate::Bookshelf> Represents a Bookshelf in Cellucidate


=item L<Cellucidate::Base> Base class for each resrouce


=back

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
