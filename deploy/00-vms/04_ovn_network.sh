#!/bin/bash 

ovs-vsctl add-br br-vxland0
#nmcli con up br-vxland0
ip link set dev br-vxland0 up

rm -f /etc/sysctl.d/10-vlan8X-forwarding.conf
touch /etc/sysctl.d/10-vlan8X-forwarding.conf


for i in {80..88}
do
  echo "Preparing vlan $i"
  subnet=$(expr $i - 80)
  nmcli con add type vlan con-name vlan$i ifname vlan$i dev br-vxland0 id $i ip4 10.8.$subnet.1/24 connection.autoconnect true
  echo "net.ipv4.conf.vlan$i.forwarding=1" >> /etc/sysctl.d/10-vlan8X-forwarding.conf
  nmcli con up vlan$i
done

virsh net-define libvirt-network/vxland.xml
virsh net-start vxland
virsh net-autostart vxland
