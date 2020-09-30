echo "Forwards from me:"
for n in `/root/script/nodes.sh`; do
  echo -n "$n :"
  /root/script/speed.sh $n 
done
echo
echo "Backwards towards me:"
for n in `/root/script/nodes.sh`; do
  echo -n "$n :"
  /root/script/speed.sh $n -R 
done

