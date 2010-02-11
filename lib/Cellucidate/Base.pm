package Cellucidate::Base;

use Data::Dumper;
use Cellucidate::Request;

our $CONFIG = {
    host => 'http://api.cellucidate.com'
};

sub new {
    my $class = shift;
    my $self = bless({}, $class);
    $self;
}

sub client {
    my $self = shift;
    $self->{_client} = shift if ($_[0]);
    $self->{_client} = Cellucidate::Request->new($CONFIG) unless $self->{_client};
    $self->{_client};
}

sub find {
    my $self = shift;
    my $args = $self->args(@_);
    my $query = $self->formulate_query($args);
    $self->client->GET($self->route . "/$query")->processResponseAsArray($self->element);
}

sub show {
    my $self = shift;
    my $id = shift;
    $self->client->GET($self->route . "/" . $id)->processResponse;
}

sub route {
   die "Override in subclass"; 
}

sub element {
   die "Override in subclass"; 
}

sub args {
    my $package = $_[0];
    my $args = {};
    if (ref $_[0] eq 'HASH') {
        $args = @_;
    } elsif (scalar @_ && scalar @_ % 2 == 0) {
        $args = { @_ };
    }
    return $args->{$package} if $package;
    $args;
}

sub formulate_query {
    my $args = args(@_);
    my $query = '';
    foreach my $key (keys %{$args}) { 
        $query = '?' if $query eq '';
        $query .= "$key=" . $args->{$key} . "&"; 
    }
    $query;
}

1;
