class samba::common {
  package {'samba-common':
    ensure => installed,
  }

  concat {'/etc/samba/smb.conf':
    owner  => root,
    group  => root,
    mode   => '0644',
    notify => Service['samba'],
  }

}
