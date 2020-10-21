if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 1 ]; then
  echo "Will flash LED on node $1 via ssh"
  ssh 192.168.2.$1 "/root/script/flashled.sh "
else
  if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq $1 ]; then
    echo "Will flash LED on myself"
    /root/script/flashled.sh
  else
    echo "Flash the LED on another node from the master hub or the node itself"
  fi
fi
