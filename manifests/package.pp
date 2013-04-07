class freeradius::package(
  $server,
  $client
) {

  if $server == true {
    if $::operatingsystem == Gentoo {
      file{ '/etc/portage/package.use/10_freeradius':
        content => 'net-dialup/freeradius pam readline ssl ldap python ruby'
      } -> file { '/etc/portage/package.use/10_freeradius__openldap':
        content => 'net-nds/openldap minimal'
      } -> Package[$freeradius::params::radius['packages']]
    }
    package { $freeradius::params::radius['packages']:
      ensure => present,
    }
  }
  if $client == true {
    package { $freeradius::params::radius['client_packages']:
      ensure => present,
    }
  }
}
