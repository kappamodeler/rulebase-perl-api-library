package Cellucidate::Plot;

use base Cellucidate::Base;

sub route { '/plots'; }
sub element { 'plot'; }


# Cellucidate::Plot->series($plot_id);
sub series {
    my $self = shift;
    my $id = shift;
    $self->client->GET($self->route . "/$id" . Cellucidate::Series->route)->processResponseAsArray(Cellucidate::Series->element);
}

1;
