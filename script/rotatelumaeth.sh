cd /etc/config

sed -i s%eth2%eth3%g network
sed -i s%eth1%eth2%g network
sed -i s%eth0%eth1%g network
sed -i s%eth3%eth0%g network

cd -

batethmac=`ifconfig | grep HW | grep \`uci get network.bat_eth.ifname\` |cut -d ":" -f 3-|sed 's% %%g'`
uci set network.bat_eth.macaddr="00:${batethmac}"
uci changes
uci commit

/etc/init.d/network restart

