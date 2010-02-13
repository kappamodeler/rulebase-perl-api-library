package Cellucidate::Model;

use base Cellucidate::Base;

sub route { '/models'; }
sub element { 'model'; }

# Cellucidate::Book->models_rules($model_id);
sub model_rules {
    my $self = shift;
    my $id = shift;
    my $format = shift;

    $self->rest('GET', $self->route . "/$id" . Cellucidate::ModelRule->route, $format)->processResponseAsArray(Cellucidate::ModelRule->element);
} 

# Cellucidate::Book->initial_conditions($model_id);
sub initial_conditions {
    my $self = shift;
    my $id = shift;
    my $format = shift;

    $self->rest('GET', $self->route . "/$id" . Cellucidate::InitialCondition->route, $format)->processResponseAsArray(Cellucidate::InitialCondition->element);
}

# Cellucidate::Book->simulation_runs($model_id);
sub simulation_runs {
    my $self = shift;
    my $id = shift;
    my $format = shift;
    
    $self->rest('GET', $self->route . "/$id" . Cellucidate::SimulationRun->route, $format)->processResponseAsArray(Cellucidate::SimulationRun->element);
}

1;
