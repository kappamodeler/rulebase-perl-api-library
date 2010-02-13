#!/usr/bin/env perl

use t::TestHelper;

my @modules = qw/
    Cellucidate
    Cellucidate::Request
    Cellucidate::Bookshelf
    Cellucidate::Book
    Cellucidate::Model
    Cellucidate::ModelRule
    Cellucidate::InitialCondition
    Cellucidate::SimulationRun
    Cellucidate::Plot
    Cellucidate::Series
    Cellucidate::Job
/;

plan tests => scalar(@modules);

foreach my $module (@modules) { use_ok($module); }
