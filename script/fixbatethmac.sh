echo "fixing backhaul mac address(es)" # to stop "received packet on bat0 with own address as source address" warnings
batethmac=`ifconfig | grep HW | grep ^\`uci get network.bat_eth.ifname\` |cut -d ":" -f 3-|sed 's% %%g'`
uci set network.bat_eth.macaddr="00:${batethmac}"
if /root/script/model.sh |grep -q "Wavlink WL-WN531A6"; then
 uci set network.d_lan1.macaddr="00:${batethmac}"
 uci set network.d_lan2.macaddr="00:${batethmac}"
fi
if /root/script/model.sh |grep -q "Xiaomi Redmi Router AC2100"; then
 uci set network.d_lan2.macaddr="00:${batethmac}"
 uci set network.d_lan3.macaddr="00:${batethmac}"
fi
uci changes
uci commit
/etc/init.d/network reload

