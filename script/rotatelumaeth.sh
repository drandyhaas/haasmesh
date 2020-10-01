cd /etc/config

sed -i s%eth2%eth3%g network
sed -i s%eth1%eth2%g network
sed -i s%eth0%eth1%g network
sed -i s%eth3%eth0%g network

cd -

/etc/init.d/network restart

