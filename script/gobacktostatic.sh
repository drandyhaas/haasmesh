echo "going static 19"
uci set network.lan.proto='static'
uci set network.lan.ipaddr='192.168.2.19'
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.gateway='192.168.2.1'
uci set network.lan.dns='192.168.2.1'
uci set wireless.ap_2g_1.ssid='HaasMesh_NewNode'
uci set wireless.ap_5g_1.ssid='HaasMesh_NewNode'
uci set wireless.ap_5g_2.ssid='HaasMesh_NewNode'
uci changes
uci commit
/etc/init.d/network reload
#wifi reload

