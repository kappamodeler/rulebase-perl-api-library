use Test::More;
use strict;
use warnings;
use Data::Dumper;

require HTTP::Server::Simple;

BEGIN { unshift @INC, "../lib"; }


# -------------
package TestHelper;

our($PID, $PORT);

sub setup {
    $PORT = 7657;
    $PID  = REST::Client::TestServer->new($PORT)->background();
    $Cellucidate::Base::CONFIG = { host => "http://localhost:$PORT" };
}

sub teardown {
    kill 15, $PID;
    exit;
}



# -------------
package REST::Client::TestServer;

use base qw(HTTP::Server::Simple::CGI);
use File::Basename;

sub handle_request {
    my ( $self, $cgi ) = @_;

    my $path = $cgi->path_info();
    # $cgi->param;
    my $fixture_filename = dirname(__FILE__) . "/fixtures$path";
    $fixture_filename =~ s/\/$//;
    $fixture_filename .= '.http';

    if (-e $fixture_filename) {
        open FH, $fixture_filename;
        print <FH>;
        close FH;
    } else {
        print "HTTP/1.1 500";
        die "Can't open $fixture_filename";
    }
}


sub valid_http_method {
    my $self = shift;
    my $method = shift or return 0;
    return $method =~ /^(?:GET|POST|HEAD|PUT|DELETE|OPTIONS)$/;
}

1;
