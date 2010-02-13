package Cellucidate::Book;

use base Cellucidate::Base;

sub route   { '/books'; }
sub element { 'book';   }


# Cellucidate::Book->models($book_id);
sub models {
    my $self = shift;
    my $id = shift;
    my $format = shift;
    
    $self->rest('GET', $self->route . "/$id" . Cellucidate::Model->route, $format)->processResponseAsArray(Cellucidate::Model->element);
} 

1;
