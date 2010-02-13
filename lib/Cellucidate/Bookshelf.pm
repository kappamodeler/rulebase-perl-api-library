package Cellucidate::Bookshelf;

use base Cellucidate::Base;

sub route   { '/bookshelves'; }
sub element { 'bookshelf';   }


# Cellucidate::Bookshelf->books($bookshelf_id);
sub books {
    my $self = shift;
    my $id = shift;
    
    $self->rest('GET', $self->route . "/$id" . Cellucidate::Book->route)->processResponseAsArray(Cellucidate::Book->element);
} 

1;
