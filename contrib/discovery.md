#### Service discovery concepts


```
ipa service-add build/build.vxland.syscallx86.com@VXLAND.SYSCALLX86.COM
ipa-getkeytab -p build/build.vxland.syscallx86.com@VXLAND.SYSCALLX86.COM -k /etc/build.keytab
ipa dnsrecord-add vxland.syscallx86.com _build._tcp --srv-port=22 --srv-priority=0 --srv-weight=100 --srv-target=build
``` 