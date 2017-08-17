# === Class: quagga
#
# === Description
#
# === Parameters
#
# === Examples
#
# === Authors
#
# Thomas Vassilian <thomas@kernel23.org>
# URL : https://github.com/kernel23/puppet-quagga/
#
# Initial work ...
#
# Leslie Carr <leslie@cumulusnetworks.com>
# URL : https://github.com/LeslieCarr/puppet-quagga
#
# === License
# Apache v2
#

class quagga (
  $asn = $::quagga::params::asn,
  $hostname = $::quagga::params::hostname,
  $password = $::quagga::params::password,
  $enable = $::quagga::params::enable,
  $password_encryption = $::quagga::params::password_encryption,
  $ipv4_network = $::quagga::params::ipv4_network,
  $router_id = $::quagga::params::router_id,
  $bgp_logfile = $::quagga::params::bgp_logfile,
  $bgpd = $::quagga::params::bgpd,
  $zebra = $::quagga::params::zebra,
  $isisd = $::quagga::params::isisd,
  $ospfd = $::quagga::params::ospfd,
  $ospf6d = $::quagga::params::ospf6d,
  $ripd = $::quagga::params::rip,
  $ripngd = $::quagga::params::ripngd,
  $babeld = $::quagga::params::babeld,
  $bgp_alwyscomparemed = $::quagga::params::bgp_alwayscomparemed,
  $bgp_neighbors = $::quagga::params::bgp_neighbors,
  $ipv6_network = $::quagga::params::ipv6_network,
  $ipv6_bgp_neighbors = $::quagga::params::ipv6_neighbors,
  $ip_prefix_list = $::quagga::params::ip_prefix_list,
  $ipv6_prefix_list = $::quagga::params::ipv6_prefix_list,
  $route_map = $::quagga::params::route_map,
  $zebra_logfile = $::quagga::params::zebra_logfile,
  $zebra_interfaces = $::quagga::params::zebra_interfaces,
  $service_enable = $::quagga::params::service_enable,
  $service_ensure = $::quagga::params::service_ensure,
) inherits quagga::params
{

  package { 'quagga':
    ensure   => present,
    before   => Service['quagga']
  }

  service { 'quagga':
    ensure      => $service_ensure ? {
      'UNDEF' => undef,
      default => $service_ensure,
    },
    hasrestart  => true,
    hasstatus   => false,
    enable      => $service_enable,
  }

  file { '/etc/quagga/daemons':
    mode    => '0644',
    owner   => 'quagga',
    group   => 'quagga',
    content => template('quagga/daemons.erb'),
    notify  => Service['quagga'],
    require => Package['quagga'],
  }

  file { '/etc/quagga/vtysh.conf':
    mode    => '0644',
    owner   => 'quagga',
    group   => 'quagga',
    content => template('quagga/vtysh.conf.erb'),
    notify  => Service['quagga'],
    require => Package['quagga'],
  }

  file { '/etc/quagga/debian.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('quagga/debian.conf.erb'),
    notify  => Service['quagga'],
    require => Package['quagga'],
  }

  if $zebra == true {
    include quagga::zebra
  }

  if $bgpd == true {
    include quagga::bgpd
  }

  if $ospfd == true {
    include quagga::ospfd
  }

  if $ospf6d == true {
    include quagga::ospf6d
  }

  if $ripd == true {
    include quagga::ripd
  }

  if $ripngd == true {
    include quagga::ripngd
  }

  if $isisd == true {
    include quagga::isisd
  }

  if $babeld == true {
    include quagga::babeld
  }

}
