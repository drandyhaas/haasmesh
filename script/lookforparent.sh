PARENT=0
while [ $PARENT == 0 ]; do
echo "looking for parent..."

#first look to see if I get get an IP from a DHCP server (the hub)
udhcpc -i br-lan -s " " -n -q -R -f -S -t 20 -A 60 &> dhcp.log # wait up to 60s for a lease
grep obtained dhcp.log | grep "192\.168\.2\."
if [ $? -eq 0 ]; then
  PARENT=2 # I'm the child of a local dhcp server, so I'm a node
  myip=`grep obtained dhcp.log | cut -d " " -f 4`
  echo "dhcp gave ip \"${myip}\""
  wget 192.168.2.1/allnodes.txt
  for i in $(seq 2 17) ; do grep -x 192.168.2.$i allnodes.txt > /dev/null ; if [ $? -eq 1 ]; then echo "192.168.2.$i not found "; myip="192.168.2.${i}"; break; fi; done
  echo "based on allnodes.txt, using ip \"${myip}\""
  rm -f allnodes.txt
else
  #if we can't get a local IP from DHCP, then maybe we're a hub
  #see if we have an address on WAN interface, like we're plugged into a router/modem

  ifconfig |grep -v Scope |grep -v 192.168.2. | grep -v 127.0.0.1 | grep -c inet > Nips.txt
  if [ `cat Nips.txt` != 0 ]; then
    PARENT=1
  fi
  rm Nips.txt
fi
rm dhcp.log
echo "PARENT = $PARENT"

if [ $PARENT -eq 1 ]; then
echo "going static as hub"
uci set network.lan.proto='static'
uci set network.lan.ipaddr='192.168.2.1'
uci set network.lan.netmask='255.255.255.0'
uci del network.lan.gateway
uci del network.lan.dns

uci del dhcp.lan.ignore
uci set dhcp.lan.ra='server'
uci set dhcp.lan.limit='230'
uci set dhcp.lan.start='20'
uci set dhcp.lan.dhcpv6='server'
uci set dhcp.lan.leasetime='12h'
uci set dhcp.lan.ra_management='1'
uci set dhcp.lan.force='1'

uci set wireless.ap_2g_1.ssid='HaasMeshWifi'
uci set wireless.ap_5g_1.ssid='HaasMeshWifi'
uci set wireless.ap_5g_2.ssid='HaasMeshWifi'

fi

if [ $PARENT -eq 2 ]; then
echo "going static as satellite"
uci set network.lan.proto='static'
uci set network.lan.ipaddr=$myip
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.gateway='192.168.2.1'
uci set network.lan.dns='192.168.2.1'

uci set dhcp.lan.ignore='1'
uci del dhcp.lan.start
uci del dhcp.lan.limit
uci del dhcp.lan.leasetime
uci del dhcp.lan.force
uci del dhcp.lan.ra
uci del dhcp.lan.dhcpv6
uci del dhcp.lan.ra_management

uci set wireless.ap_2g_1.ssid='HaasMeshWifi'
uci set wireless.ap_5g_1.ssid='HaasMeshWifi'
uci set wireless.ap_5g_2.ssid='HaasMeshWifi'

fi

#if [ $PARENT -eq 0 ]; then exit; fi
done # looping until we find a parent
echo "committing changes and restarting iface"
uci changes
uci commit
if [ $PARENT -eq 1 ]; then
  i2cset -y 2 0x48 5 5 5 0 i #for luma, spinning purple
  reboot # seem to need this, to get default routes working, restart dhcp server, etc
fi
/etc/init.d/network reload
#wifi reload
echo "done finding parent"
ash /etc/rc.local # restart some stuff
