package Cellucidate::Book;

use base Cellucidate::Base;

sub route   { '/books'; }
sub element { 'book';   }


# Cellucidate::Book->models($book_id);
sub models {
    my $self = shift;
    my $id = shift;
    $self->client->GET($self->route . "/$id" . Cellucidate::Model->route)->processResponseAsArray(Cellucidate::Model->element);
} 

1;
