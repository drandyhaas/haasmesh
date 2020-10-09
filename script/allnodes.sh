#make /www/allnodes.txt
myip=`/root/script/myip.sh`
nodes=`/root/script/nodes.sh`
#the db of nodes is only kept on the hub
if [ `echo $myip | cut -f 4 -d . ` -eq 1 ]; then
  touch /www/allnodes.txt
  for n in $nodes; do
    grep -x $n /www/allnodes.txt >/dev/null
    if [ $? -eq 1 ]; then echo $n >> /www/allnodes.txt; fi
  done
fi
cat /www/allnodes.txt |uniq > /www/allnodes.txt
