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

# Celllucidate::Book->agents($book_id);
sub agents {
    my $self = shift;
    my $id = shift;
    my $format = shift;
    $self->rest('GET', $self->route . "/$id" . Cellucidate::Agent->route, $format)->processResponseAsArray(Cellucidate::Agent->element);
}

# Celllucidate::Book->rules($book_id);
sub rules {
    my $self = shift;
    my $id = shift;
    my $format = shift;
    $self->rest('GET', $self->route . "/$id" . Cellucidate::Rule->route, $format)->processResponseAsArray(Cellucidate::Rule->element);
}

1;
