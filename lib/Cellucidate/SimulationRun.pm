package Cellucidate::SimulationRun;

use base Cellucidate::Base;

sub route { '/simulation_runs'; }
sub element { 'simulation-run'; }

# Cellucidate::Bookshelf->plots($simulation_run_id);
sub plots {
    my $self = shift;
    my $id = shift;
    my $format = shift;
    $self->rest('GET', $self->route . "/$id" . Cellucidate::Plot->route, $format)->processResponseAsArray(Cellucidate::Plot->element);
}

1;
