puppet-quagga
=============

Project : https://github.com/kernel23/puppet-quagga/

A puppet module for Quagga daemon running on Debian (best OS ever). Main goal (and difference with others modules) is to cover ALL available options within Class to avoid static templates. Work in progress (mostly done for BGP), contributions welcome.

If you are looking for automation related to BGP, you might be also interested in another personal project called "json-schema-quagga-bgpd". Please check : https://github.com/kernel23/json-schema-quagga-bgpd 

Based on : https://github.com/LeslieCarr/puppet-quagga

## Example for BGP configuration

In Puppet / Ruby syntax :

	class {'quagga':
		asn=> "65001",
		zebra=> true,
		bgpd=> true,
		hostname=> "host.bgp.me",
		password=> "password",
		enable=> "strong_password",
		network=>[
			"192.168.1.0/25",
			"192.168.1.128/25"
		],
		router_id=> "10.0.0.1",
		bgp_neighbors =>{
			"bgp1"=>{
				neighbor_ip   => "10.0.0.2",
				neighbor_as   => "65002",
				description   => "AS-002",
				route_map_in  => "med-100",
				route_map_out => "med-100"
			},
			"bgp2"=>{
				neighbor_ip => "10.0.0.3",
				neighbor_as => "65003",
				description => "AS-003",
				next_hop_self => true
			},
		},
		ip_prefix_list =>{
			"line1"=>{
				name => "ALL",
				description => "TEST-DESC"
			},
			"line2"=>{
				name => "ALL",
				num => "10",
				action => "deny",
				prefix => "10.0.0.0/8"
			}
		},
		route_map =>{
			"MED"=> {
				action => "permit",
				order => "5",
				metric => "100",
				as_path_prepend => "65002 65002",
			}
		},
	}

In JSON / Hiera syntax :

	"quagga::bgpd": true,
 	"quagga::zebra": true,
 	"quagga::asn": "65001",
 	"quagga::hostname": "host.bgp.me",
 	"quagga::password": "password",
 	"quagga::enable": "strong_password",
 	"quagga::network": [
   	"192.168.1.0/25",
   	"192.168.128.0/25",
 	],
	"quagga::router_id": "10.0.0.1",
	"quagga::bgp_neighbors": {
	"bgp1": {
		"neighbor_ip": "10.0.0.2",
		"neighbor_as": "65002",
		"description": "AS-002",
		"route_map_in": "med_100",
		"route_map_out": "med_100"
	},
	"bgp2": {
		"neighbor_ip": "10.0.0.3",
		"neighbor_as": "65003",
		"description": "AS-003",
		"next_hop_self": true
	}
