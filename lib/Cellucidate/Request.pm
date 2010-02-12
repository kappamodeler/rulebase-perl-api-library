package Cellucidate::Request;

use XML::Simple;
use REST::Client;
use Data::Dumper;

our @ISA = qw(REST::Client);

sub processResponse {
    my $self = shift;
    die "No content!" unless (my $content = $self->responseContent);
    return eval { XMLin($content, ForceArray => 0, KeepRoot => 0, KeyAttr => [], NoAttr => 1) };
}

sub processResponseAsArray {
    my $self = shift;
    my $key = shift;
    
    my $response_data;
    $response_data = $self->processResponse->{$key} if $self->processResponse;
    return ref($response_data) eq 'ARRAY' ? $response_data : [ $response_data ]; 
}

1;
