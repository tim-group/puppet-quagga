#Class quagga::bgpd

class quagga::bgpd inherits quagga {

    file { '/etc/quagga/bgpd.conf':
      mode    => '0644',
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/bgpd.conf.erb'),
      notify  => Service['quagga'],
      require => Package['quagga'],
    }
}
