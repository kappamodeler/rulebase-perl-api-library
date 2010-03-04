#!/usr/bin/env perl

use t::TestHelper;

my @modules = qw/
    Cellucidate
    Cellucidate::Request
    Cellucidate::Bookshelf
    Cellucidate::Book
    Cellucidate::Agent
    Cellucidate::Rule
    Cellucidate::Model
    Cellucidate::ModelRule
    Cellucidate::RuleObservable
    Cellucidate::SolutionObservable
    Cellucidate::InitialCondition
    Cellucidate::SimulationRun
    Cellucidate::Plot
    Cellucidate::Series
    Cellucidate::KappaImportJob
/;

plan tests => scalar(@modules);

foreach my $module (@modules) { use_ok($module); }
