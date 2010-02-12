package Cellucidate::Model;

use Cellucidate::Base;

our @ISA = qw(Cellucidate::Base);

sub route { '/models'; }
sub element { 'model'; }

1;
