class freeradius::listen::acct (
  $listen_ip   = '*',
  $listen_ipv6 = undef,
  $port        = '0',
  $interface   = undef,
  $clients     = undef
) {

  freeradius::listen { "acct-${name}":
    type        => 'acct',
    listen_ip   => $listen_ip,
    listen_ipv6 => $listen_ipv6,
    port        => $port,
    interface   => $interface,
    clients     => $clients
  }
} 
