package Cellucidate::Book;

use Cellucidate;
use Cellucidate::Request;


sub show {
    my $params = parameterize(@_);
    die "You need to pass in an id parameter!" unless my $id = $params->{'Cellucidate::Bookshelf'}->{'id'};
    my $client = Cellucidate::Request->new( { host => 'http://localhost:7657' } );
    return $client->GET("/bookshelves/$id")->processResponse;
}

1;

