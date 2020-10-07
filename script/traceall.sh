for n in `/root/script/nodes.sh`; do 
  if [ $n == `/root/script/myip.sh` ]; then continue; fi; 
  echo "To get to $n:"
  batctl tr $n | grep -v traceroute | cut -d '(' -f 1
done
