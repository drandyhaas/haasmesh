myip=`/root/script/myip.sh`
nodes=`/root/script/nodes.sh`

#the db of nodes is only kept on the hub
if [ `echo $myip | cut -f 4 -d . ` -eq 1 ]; then 
  /root/script/allnodes.sh # remake the file (also done in bathosts.sh periodically)
  allnodes=`cat /www/allnodes.txt | sort`
else
  allnodes=`echo $nodes | sort`
fi

pings=`for i in $allnodes ; do echo $i; /root/script/pingip.sh $i ; done | grep seq=0`

echo "<table><tr> <th><h3>Node IP</h3></th> <th><h3>Mesh</h3></th> <th><h3>Ping</h3></th> </tr>"
for n in $allnodes; do
  echo "<tr><th>"
  if [ "$n" == "$myip" ]; then 
   echo "<h4>$n</h4>"
  else 
   echo "<h4><a href=\"http://${n}\" rel=\"noopener noreferrer\" target=\"_blank\">$n</a></h4>"
  fi

  nn=`echo $n | cut -f 4 -d .`

  echo "</th><th>"
  echo "${nodes}" | grep -x $n >/dev/null
  if [ $? -eq 1 ]; then echo "<span class="reddot" onclick=\"removeNode(${nn})\"></span>"; 
  else echo "<span class="greendot"></span>"; fi

  echo "</th><th>"
  echo $pings | grep "${n}:" >/dev/null
  if [ $? -eq 1 ]; then echo "<span class="reddot"></span>";
  else echo "<span class="greendot"></span>"; fi

  echo "</th></tr>"
done
echo "</table>"
echo "Click on a red mesh dot to remove the node from the list"
