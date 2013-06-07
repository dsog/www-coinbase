package WWW::Coinbase::Role::Uri;

use Moo::Role;
use URI;

sub uri {
    return URI->new('https://coinbase.com/api/v1');
}

1;
