#quagga::zebra
class quagga::zebra inherits quagga {
    file { '/etc/quagga/zebra.conf':
      mode    => '0644',
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/zebra.conf.erb'),
      notify  => Service['quagga'],
      require => Package['quagga'],
    }
}
