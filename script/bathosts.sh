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
  allnodes=`cat /www/allnodes.txt`
else
  allnodes=$nodes
fi

#make /etc/bat-hosts
alfred -r 66 |sed "s%qqq%\n%g" | grep "{\|HWaddr" > /tmp/alfmacs.txt
rm /etc/bat-hosts
touch /etc/bat-hosts
while read p; do
  #echo $p
  echo $p | grep { > /dev/null
  if [ $? -eq 0 ]; then 
   #mac=`echo "$p" | cut -d " " -f 2 |sed 's%\"%%' | sed 's%\",%%' `
   ip=`echo "$p" | cut -d " " -f 3 |sed 's%\"%%' `
   ipn=1
   #echo $mac $ip 
  else
   mac=`echo $p | cut -d " " -f 5`
   #check if we already seen this mac
   grep $mac /etc/bat-hosts > /dev/null
   if [ $? -eq 0 ]; then
     true
   else
     echo $mac ${ipn}-${ip} >> /etc/bat-hosts
     let "ipn=ipn+1"
   fi
  fi
done < /tmp/alfmacs.txt
