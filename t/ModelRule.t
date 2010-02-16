#!/usr/bin/env perl

use t::TestHelper;

plan tests => 9;

use_ok('Cellucidate::ModelRule');

TestHelper->setup;

eval {
    # Find
    ok(Cellucidate::ModelRule->find( { model_id => 10 } ));
    is(Cellucidate::ModelRule->client->responseCode, '200');

    # Show
    is(Cellucidate::ModelRule->get(1)->{id}, 1);
    
    # Update
    Cellucidate::ModelRule->update(1, { 'backward-rate' => 5 });
    is(TestHelper->last_request->{method}, 'PUT');
    like(TestHelper->last_request->{query}, qr/<backward-rate>5<\/backward-rate>/);
    
    Cellucidate::ModelRule->create({ 'backward-rate' => 6, 'forward-rate' => 1, });
    is(TestHelper->last_request->{method}, 'POST');
    like(TestHelper->last_request->{query}, qr/<forward-rate>1<\/forward-rate>/);
    like(TestHelper->last_request->{query}, qr/<backward-rate>6<\/backward-rate>/);
};

warn "Tests died: $@" if $@;

TestHelper->teardown;
