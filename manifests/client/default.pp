class freeradius::client::default (
  $clients = {}
) {
  
  $default = {  
    'ipaddr'                        => undef,
    'ipv6addr'                      => undef,
    'netmask'                       => $freeradius::params::client['netmask'],
    'nastype'                       => $freeradius::params::client['nastype'],
    'require_message_authenticator' => $freeradius::params::client['require_message_authenticator'],
    'login'                         => undef,
    'password'                      => undef,
    'virtual_server'                => undef,
    'coa_server'                    => undef
  }
  create_resources(freeradius::client, $clients, $default)
}