package WWW::Coinbase::Authorize;

use Moo;
with 'WWW::Coinbase::Role::Uri';

# ABSTRACT: A client library for Coinbase REST API.

has client_id => (
    is      => 'ro',
    required=> 1,
);

has callback => (
    is      => 'ro',
    required=> 1,
);

sub uri_as_string {
    my ($self) = @_;
    my $uri = $self->uri;
    $uri->path('oauth/authorize');
    my %query = (
        client_id       => $self->client_id,
        redirect_uri    => $self->callback,
        response_type   => 'code',
    );
    $uri->query_form(%query);
    return $uri->as_string;
}

1;
