myip=`/root/script/myip.sh`
echo "Forwards from me:"
for n in `/root/script/nodes.sh`; do
  if [ $n == "192.168.2.19" ]; then echo "skipping 192.168.2.19"; continue; fi # don't try to do this dummy node
  if [ $n == $myip ]; then continue; fi
  echo -n "$n :"
  /root/script/speed.sh $n 
done
echo
echo "Backwards towards me:"
for n in `/root/script/nodes.sh`; do
  if [ $n == "192.168.2.19" ]; then echo "skipping 192.168.2.19"; continue; fi # don't try to do this dummy node
  if [ $n == $myip ]; then continue; fi
  echo -n "$n :"
  /root/script/speed.sh $n -R 
done

