class samba::server inherits samba::common {
  package { 'samba':
    ensure => installed,
  }

  $samba_service_name = $::lsbdistcodename ? {
    'jessie' => 'smbd',
    'Core'   => 'smb',
    default  => 'samba',
  }

  service { 'samba':
    ensure  => running,
    name    => $samba_service_name,
    pattern => 'smbd',
    require => Package[samba],
  }

  file { '/etc/samba':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0755',
    require => Package[samba],
  }
}
