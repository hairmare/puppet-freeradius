class freeradius::listen::default (
  $listeners = {
    'default-acct' => {
      'type' => 'acct'
    },
    'default-auth' => {
      'type' => 'auth'
    },
    'control-socket' => {
      'type'   => control,
      'socket' => true
    }
  }
) {

  $defaults = {
    'type'        => 'acct',
    'listen_ip'   => '*',
    'listen_ipv6' => undef,
    'port'        => '0',
    'interface'   => undef,
    'clients'     => undef,
    'socket'      => false,
    'uid'         => 'radius',
    'gid'         => 'radius',
    'mode'        => 'rw'
  }
  
  create_resources(freeradius::listen, $listeners, $defaults)
} 
