for n in `/root/script/nodes.sh`; do 
  if [ $n == `/root/script/myip.sh` ]; then continue; fi; 
  if [ $n == "192.168.2.19" ]; then echo "skipping 192.168.2.19"; continue; fi # don't try to do this dummy node
  echo "To get to $n:"
  batctl tr $n | grep -v traceroute | cut -d '(' -f 1
done
