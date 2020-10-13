
#flush the arp cache of 192.168.2.19, every 10 seconds, for 2 minutes, useful for when an old 19 newnode is going to be replaced with some new one

for i in $(seq 0 12) ; do
echo "arpflush iter $i "

echo "starting neigh and dc"
ip neigh |grep "192\.168\.2\.19 "
batctl dc |grep "192\.168\.2\.19 "

echo "flushing 19"
ip neigh flush 192.168.2.19

echo "ip neigh 19?"
ip neigh |grep "192\.168\.2\.19 "
echo "dat cache 19?"
batctl dc |grep "192\.168\.2\.19 "

sleep 10

done
