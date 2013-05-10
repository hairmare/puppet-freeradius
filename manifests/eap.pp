class freeradius::eap (
  $default_eap_type                       = 'md5',
  $timer_expire                           = '60',
  $ignore_unknown_eap_types               = 'no',
  $cisco_accounting_username_bug          = 'no',
  $eap_mp5                                = true,
  $eap_leap                               = true,
  $eap_gtc                                = true,
  $eap_gtc_auth_type                      = 'PAP',
  $eap_tls                                = true,
  $eap_tls_certdir                        = '${confdir}/certs',
  $eap_tls_cadir                          = '${confdir}/certs',
  $eap_tls_cn                             = undef,
  $eap_tls_private_key_password           = undef,
  $eap_tls_private_key_file               = '${certdir}/server.pem',
  $eap_tls_certificate_file               = '${certdir}/server.pem',
  $eap_tls_ca_file                        = '${cadir}/ca.pem',
  $eap_tls_dh_file                        = '${certdir}/dh',
  $eap_tls_random_file                    = '${certdir}/random',
  $eap_tls_fragment_size                  = undef,
  $eap_tls_include_length                 = undef,
  $eap_tls_check_crl                      = undef,
  $eap_tls_ca_path                        = '${cadir}',
  $eap_tls_check_cert_issuer              = undef,
  $eap_tls_check_cert_cn                  = undef,
  $eap_tls_cipher_list                    = 'DEFAULT',
  $eap_tls_make_cert_command              = '${certdir}/bootstrap',
  $eap_tls_ecdh_curve                     = 'prime256v1',
  $eap_tls_cache_enable                   = 'no',
  $eap_tls_cache_lifetime                 = '24',
  $eap_tls_cache_max_entries              = '255',
  $eap_tls_verify_tmpdir                  = undef,
  $eap_tls_verify_client                  = undef,
  $eap_tls_ocsp_enable                    = 'no',
  $eap_tls_ocsp_override_cert_url         = 'yes',
  $eap_tls_ocsp_url                       = 'http://127.0.0.1/ocsp/',
  $eap_tls_ocsp_use_nonce                 = undef,
  $eap_tls_ocsp_timeout                   = undef,
  $eap_tls_ocsp_softfail                  = undef,
  $eap_ttls                               = true,
  $eap_ttls_default_eap_type              = 'md5',
  $eap_ttls_copy_request_to_tunnel        = 'no',
  $eap_ttls_use_tunneled_reply            = 'no',
  $eap_ttls_virtual_server                = 'inner-tunnel',
  $eap_ttls_include_length                = undef,
  $eap_peap                               = true,
  $eap_peap_default_eap_type              = 'mschapv2',
  $eap_peap_copy_request_to_tunnel        = 'no',
  $eap_peap_use_tunneled_reply            = 'no',
  $eap_peap_proxy_tunneled_request_as_eap = undef,
  $eap_peap_virtual_server                = 'inner-tunnel',
  $eap_peap_soh                           = false,
  $eap_peap_soh_virtual_server            = 'soh-server',
  $eap_mschapv2                           = true,
  $eap_mschapv2_send_error                = undef
) inherits freeradius::params {
  
  file { "${freeradius::params::radius['base_dir']}/eap.conf":
    ensure  => file,
    content => template('freeradius/common/eap.conf.erb'),
    group   => $freeradius::params::radius['gid'],
    mode    => '0640',
  }
}