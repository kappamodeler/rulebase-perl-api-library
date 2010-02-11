#!/usr/bin/env perl

use t::TestHelper;
use Data::Dumper;

plan tests => 7;

use_ok('Cellucidate::Bookshelf');

TestHelper->setup;

eval {
    # Find
    is(Cellucidate::Bookshelf->find()->[0]->{name}, 'My First Bookshelf');
    is(Cellucidate::Bookshelf->find()->[1]->{name}, 'My Second Bookshelf');
    is(Cellucidate::Bookshelf->find( { foo => 'bar' } )->[1]->{name}, 'My Second Bookshelf');
    is(Cellucidate::Bookshelf->client->responseCode(), '200');

    # Show
    is(Cellucidate::Bookshelf->show(1)->{name}, 'My First Bookshelf');
    is(Cellucidate::Bookshelf->show(1)->{id}, 1);
};

warn "Tests died: $@" if $@;

TestHelper->teardown;

