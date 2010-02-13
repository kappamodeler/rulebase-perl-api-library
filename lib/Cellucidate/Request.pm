package Cellucidate::Request;

use base REST::Client;

use XML::Simple;
use Data::Dumper;

sub processResponse {
    my $self = shift;
    die "No content!" unless (my $content = $self->responseContent);
    return eval { XMLin($content, ForceArray => 0, KeepRoot => 0, KeyAttr => [], NoAttr => 1, SuppressEmpty => undef) };
}

sub processResponseAsArray {
    my $self = shift;
    my $key = shift;
    
    my $response_data = $self->processResponse->{$key} if $self->processResponse;

    return [] unless $response_data;
    return ref($response_data) eq 'ARRAY' ? $response_data : [ $response_data ]; 
}

1;
