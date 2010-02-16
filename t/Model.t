#!/usr/bin/env perl

use t::TestHelper;

plan tests => 10;

use_ok('Cellucidate::Model');

TestHelper->setup;

eval {
    # Find
    is(Cellucidate::Model->find()->[0]->{name}, 'RAF/MEK/ERK Cascase w/out SoS Feedba');
    is(Cellucidate::Model->find()->[1]->{name}, 'RAF/MEK/ERK Cascade with SoS Feedbac');
    is(Cellucidate::Model->client->responseCode(), '200');

    # Show
    is(Cellucidate::Model->get(121)->{name}, 'RAF/MEK/ERK 121');
    is(Cellucidate::Model->get(121)->{id}, 121);
    
    # Update
    Cellucidate::Model->update(121, { name => 'foo' });
    is(TestHelper->last_request->{method}, 'PUT');
    like(TestHelper->last_request->{query}, qr/<name>foo<\/name>/);
    
    Cellucidate::Model->create({ name => 'foob' });
    is(TestHelper->last_request->{method}, 'POST');
    like(TestHelper->last_request->{query}, qr/<name>foob<\/name>/);
};

warn "Tests died: $@" if $@;

TestHelper->teardown;
