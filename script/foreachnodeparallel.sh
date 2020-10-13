if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 1 ]; then
 echo "Do \"${1}\" on each node"
 for n in `/root/script/nodes.sh`; do 
  if [ $n == "192.168.2.19" ]; then echo "skipping 192.168.2.19"; continue; fi # don't try to do this dummy node            
  echo
  echo ${n}:
  ssh $n "${1}" &
 done
 echo

while true; do
 j=`jobs`
 if echo "$j" | grep -q "Running"; then echo "foreachnodeparellel: still jobs"; sleep 5; else break; fi
done
echo "foreachnodeparellel: done!"

else
 echo "Just a node, so will do \"${1}\" on only myself"
 ash -c $1
 echo
fi
