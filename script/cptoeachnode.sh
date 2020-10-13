myip=`/root/script/myip.sh`
if [ `echo $myip | cut -f 4 -d . ` -eq 1 ]; then
 echo "Send \"${1}\" to directory \"${2}\" on each node"
 for n in `/root/script/nodes.sh`; do 
  if [ $n == "192.168.2.19" ]; then echo "skipping 192.168.2.19"; continue; fi # don't try to do this dummy node
  if [ $n == $myip ]; then continue; fi # don't send to myself
  echo; echo ${n}:; scp $1 ${n}:${2} ; done
 echo
else
 echo "Just a node, so do nuttin"
fi
