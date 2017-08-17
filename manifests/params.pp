# Variables
# NOTE: uncertain whether or not to have configuration file or everything parameters
class quagga::params {

  $asn = undef
  $hostname = undef
  $password = undef
  $enable = undef
  $password_encryption = undef
  $ipv4_network = []
  $router_id = $::network_lo
  $bgp_logfile = undef
  $bgpd = undef
  $zebra = undef
  $isisd = undef
  $ospfd = undef
  $ospf6d = undef
  $rip = undef
  $ripngd = undef
  $babeld = undef
  $bgp_alwayscomparemed = false
  $bgp_neighbors = []
  $ipv6_network = undef
  $ipv6_neighbors = undef
  $ip_prefix_list = undef
  $ipv6_prefix_list = undef
  $route_map = undef
  $watch_quagga = false
  $zebra_logfile = undef
  $zebra_interfaces = undef
  $service_enable = true
  $service_ensure = running

#  $ospf_logfile = '/var/log/quagga/ospfd.log'
  #$ospf_interfaces is an array in the format 
  #$ospf_interfaces = {
  #  interface1 => { 'interface' => '', 'area' => ''},
#  }
#
  #ospf6_interfaces is an array. By default assign it the same values as ospf_interfaces
#  $ospf6_interfaces = $ospf_interfaces
}
