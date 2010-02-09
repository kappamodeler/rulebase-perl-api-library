package Cellucidate::Bookshelf;

use Cellucidate;
use Cellucidate::Request;
use Data::Dumper;

=head 4 find

    $bookshelves = Cellucidate::Bookshelf->find( { name => 'My *' } );


=cut

sub find {
    my $params = Cellucidate::parameterize(@_);
    my $query = '';
    foreach my $key (keys %{$params->{'Cellucidate::Bookshelf'}}) { 
        $query = '?' if $query eq '';
        $query .= "$key=" . $params->{'Cellucidate::Bookshelf'}->{$key} . "&"; 
    }
    my $client = Cellucidate::Request->new( { host => 'http://localhost:7657' } );
    return  $client->GET("/bookshelves$query")->processResponseAsArray('bookshelf');
}

sub show {
    my $params = Cellucidate::parameterize(@_);
    die "You need to pass in an id parameter!" unless my $id = $params->{'Cellucidate::Bookshelf'}->{'id'};
    my $client = Cellucidate::Request->new( { host => 'http://localhost:7657' } );
    return $client->GET("/bookshelves/$id")->processResponse;
}

sub books {
    my $self = shift;
    #return Cellucidate::Book->find( { bookshelf_id => $self->{id} );
}


1;
