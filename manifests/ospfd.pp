#Class quagga::ospfd

class quagga::ospfd inherits quagga {

    file { '/etc/quagga/ospfd.conf':
      mode    => '0644',
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/ospfd.conf.erb'),
      notify  => Service['quagga'],
      require => Package['quagga'] 
    }
}
