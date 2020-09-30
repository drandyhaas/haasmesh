if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 1 ]; then
echo "master hub"

for n in 19; do n="192.168.2.$n"
#for n in `/root/script/nodes.sh` 192.168.2.2 192.168.2.6; do
   echo "Setting up node $n "
   scp -r script $n:
   scp /etc/profile /etc/rc.local $n:/etc/
   scp -r /usr/lib/lua/luci/controller/myapp $n:/usr/lib/lua/luci/controller/
   scp -r /usr/lib/lua/luci/view/myapp $n:/usr/lib/lua/luci/view/
   ssh $n "ash /root/script/monstart.sh"
done

else
echo "just a node"
fi
