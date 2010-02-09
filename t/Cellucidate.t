# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Cellucidate.t'

#########################

use strict;
use warnings;
use Data::Dumper;

unshift @INC, "../lib";

# change 'tests => 1' to 'tests => last_test_to_print';
use Test::More tests => 10;
BEGIN { 
  use_ok('Cellucidate');
  use_ok('Cellucidate::Bookshelf');
};

require HTTP::Server::Simple;
my $port = 7657;
my $pid  = REST::Client::TestServer->new($port)->background();

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

eval {
  my $bookshelves = Cellucidate::Bookshelf->find();
  is(scalar(@$bookshelves), 2, "Should return two bookshelves");
  is($bookshelves->[0]->{id}, 5, "Should have the correct ID");
  is($bookshelves->[0]->{name}, 'My First ABCD', "Should have the correct ID");

  $bookshelves = Cellucidate::Bookshelf->find( { name => 'ACME' } );
  is(scalar(@$bookshelves), 1, "Should return one bookshelves");
  is($bookshelves->[0]->{id}, 5, "Should have the correct ID");
  is($bookshelves->[0]->{name}, 'ACME', "Should have the correct ID");

  my $bookshelf = Cellucidate::Bookshelf->show({ id => 2 });
  is($bookshelf->{id}, 2, "Should have the correct ID");
  is($bookshelf->{name}, 'My First ABCD', "Should have the correct ID");


};


warn "Tests died: $@" if $@;


kill 15, $pid;

exit;

package REST::Client::TestServer;

use base qw(HTTP::Server::Simple::CGI);
use Data::Dumper;

sub handle_request {
    my ( $self, $cgi ) = @_;

    my $path = $cgi->path_info();

    if ( $path =~ /bookshelves$/ ) {
        if (scalar($cgi->param)) {

        print qq|HTTP/1.1 200 OK
Connection: close
Date: Tue, 09 Feb 2010 19:15:22 GMT
Content-Type: application/xml; charset=utf-8
X-Runtime: 501
Content-Length: 269
Cache-Control: private, max-age=0, must-revalidate\r\n
<?xml version="1.0" encoding="UTF-8"?>
<bookshelves type="array">
  <bookshelf>
    <id type="integer">5</id>
    <name>ACME</name>
  </bookshelf>
</bookshelves>|;

        } else {
        print qq|HTTP/1.1 200 OK
Connection: close
Date: Tue, 09 Feb 2010 19:15:22 GMT
Content-Type: application/xml; charset=utf-8
X-Runtime: 501
Content-Length: 269
Cache-Control: private, max-age=0, must-revalidate\r\n
<?xml version="1.0" encoding="UTF-8"?>
<bookshelves type="array">
  <bookshelf>
    <id type="integer">5</id>
    <name>My First ABCD</name>
  </bookshelf>
  <bookshelf>
    <id type="integer">4</id>
    <name>Cellucidate Reference</name>
  </bookshelf>
</bookshelves>|;
      }
   }
   elsif ( $path =~ /bookshelves\/2$/ ) {
     print qq|HTTP/1.1 200 OK
Connection: close
Date: Tue, 09 Feb 2010 19:15:22 GMT
Content-Type: application/xml; charset=utf-8
X-Runtime: 501
Content-Length: 269
Cache-Control: private, max-age=0, must-revalidate\r\n
<?xml version="1.0" encoding="UTF-8"?>
<bookshelf>
  <id type="integer">2</id>
  <name>My First ABCD</name>
</bookshelf>|;

   }
    elsif ( $path =~ /error/ ) {
        print "HTTP/1.0 400 ERROR\r\n";
    }
    else {
        print "HTTP/1.0 404 NOT FOUND\r\n";
    }
    # print "\n$path";
}

sub valid_http_method {
    my $self = shift;
    my $method = shift or return 0;
    return $method =~ /^(?:GET|POST|HEAD|PUT|DELETE|OPTIONS)$/;
}

1;
