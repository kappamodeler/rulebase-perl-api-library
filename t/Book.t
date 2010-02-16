#!/usr/bin/env perl

use t::TestHelper;
use Data::Dumper;

plan tests => 7;

use_ok('Cellucidate::Book');

TestHelper->setup;
eval {
    # Find
    is(Cellucidate::Book->find()->[0]->{name}, 'My First Book');
    is(Cellucidate::Book->find()->[1]->{name}, 'My Second Book');
    is(Cellucidate::Book->find( { foo => 'bar' } )->[1]->{name}, 'My Second Book');
    is(Cellucidate::Book->client->responseCode(), '200');

    # Show
    is(Cellucidate::Book->get(1)->{name}, 'My First Book');
    is(Cellucidate::Book->get(1)->{id}, 1);
};

warn "Tests died: $@" if $@;

TestHelper->teardown;
