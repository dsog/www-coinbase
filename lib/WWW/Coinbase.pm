package WWW::Coinbase;

use Moo;

use WWW::Coinbase::Authorize;

# ABSTRACT: A client library for Coinbase REST API.

has client_id => (
    is      => 'ro',
);

has secret => (
    is          => 'ro',
    predicate   => 'has_secret',
);

has callback => (
    is      => 'ro',
);

has access_token => (
    is          => 'rw',
    predicate   => 'has_access_token',
);

sub authorize {
    my ($self) = @_;
    return WWW::Coinbase::Authorize->new(
        client_id => $self->client_id,
        callback  => $self->callback,
    );
}

1;
