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
allgood=1
echo "<table><tr> <th>Node IP</th> <th>Mesh</th> <th>Ping</th> </tr>"
for n in $allnodes; do
  echo "<tr><th>"
  if [ "$n" == "$myip" ]; then
   echo "$n"
  else
   echo "<a href=\"http://${n}\" rel=\"noopener noreferrer\" target=\"_blank\">$n</a>"
  fi

  nn=`echo $n | cut -f 4 -d .`

  echo "</th><th>"
  echo "${nodes}" | grep -x $n >/dev/null
  if [ $? -eq 1 ]; then echo "<span class="reddot" onclick=\"removeNode(${nn})\"></span>"; allgood=0;
  else echo "<span class="greendot" onclick=\"flashNode(${nn})\"></span>"; fi

  echo "</th><th>"
  echo $pings | grep "${n}:" >/dev/null
  if [ $? -eq 1 ]; then echo "<span class="reddot" onclick=\"removeNode(${nn})\"></span>"; allgood=0;
  else echo "<span class="greendot" onclick=\"flashNode(${nn})\"></span>"; fi

  echo "</th></tr>"
done
echo "</table>"
echo "Status as of `date`."
if [ $allgood -eq 0 ]; then echo "<br>Click on a red mesh or ping dot to remove the node from the list."; fi
