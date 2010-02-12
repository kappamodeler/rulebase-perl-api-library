#!/usr/bin/env perl

use t::TestHelper;
use Data::Dumper;

plan tests => 9;

use_ok('Cellucidate::Bookshelf');

TestHelper->setup;

eval {
    # Find
    is(Cellucidate::Bookshelf->find()->[0]->{name}, 'My First Bookshelf');
    is(Cellucidate::Bookshelf->find()->[1]->{name}, 'My Second Bookshelf');
    is(Cellucidate::Bookshelf->find( { foo => 'bar' } )->[1]->{name}, 'My Second Bookshelf');
    is(Cellucidate::Bookshelf->client->responseCode(), '200');

    # Show
    is(Cellucidate::Bookshelf->get(1)->{name}, 'My First Bookshelf');
    is(Cellucidate::Bookshelf->get(1)->{id}, 1);

    # Books
    ok(Cellucidate::Bookshelf->books(1));
    is(TestHelper->last_request->{path}, '/bookshelves/1/books'); 
};

warn "Tests died: $@" if $@;

TestHelper->teardown;

