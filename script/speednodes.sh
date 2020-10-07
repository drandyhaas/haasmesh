myip=`/root/script/myip.sh`
echo "Forwards from me:"
for n in `/root/script/nodes.sh`; do
  if [ $n == $myip ]; then continue; fi
  echo -n "$n :"
  /root/script/speed.sh $n 
done
echo
echo "Backwards towards me:"
for n in `/root/script/nodes.sh`; do
  if [ $n == $myip ]; then continue; fi
  echo -n "$n :"
  /root/script/speed.sh $n -R 
done

