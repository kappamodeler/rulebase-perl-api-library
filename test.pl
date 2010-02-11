#!/usr/bin/env perl

use Test::More;
plan tests => 4;

is(Base->route, '/bases');
is(Book->route, '/books');
is(Car->route, '/cars');
is(Whatever->route, '/whatevers');


# Base class ----

package Base;


sub route {
    lc("/" . shift . "s");
}



# Subclasses  ----

package Book;
use base 'Base';

# ----

package Car;
use base 'Base';

# ----

package Whatever;
use base 'Base';


