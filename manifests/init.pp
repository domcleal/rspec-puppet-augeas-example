class example {
  augeas { "net.ipv4.ip_forward":
    context => "/files/etc/sysctl.conf",
    changes => "set net.ipv4.ip_forward 1",
  }

  augeas { "fail net.ipv4.ip_forward":
    context => "/files/etc/sysctl.conf",
    changes => "clear net.ipv4.ip_forward",
  }
}
