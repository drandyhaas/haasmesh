echo "going static 19"
uci set network.lan.proto='static'
uci set network.lan.ipaddr='192.168.2.19'
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.gateway='192.168.2.1'
uci set network.lan.dns='192.168.2.1'
/etc/init.d/dnsmasq disable
/etc/init.d/dnsmasq stop
uci changes
uci commit
/etc/init.d/network reload
#wifi reload

