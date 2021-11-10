netsh advfirewall firewall add rule name="WinRM-HTTPS" dir=in localport=5986 protocol=TCP action=allow
netsh advfirewall firewall add rule name="WinRM-HTTP" dir=in localport=5985 protocol=TCP action=allow

$c = New-SelfSignedCertificate -DnsName "127.0.0.1" -CertStoreLocation cert:\LocalMachine\My
winrm create winrm/config/Listener?Address=*+Transport=HTTPS "@{Hostname=`"127.0.0.1`";CertificateThumbprint=`"$($c.ThumbPrint)`"}"