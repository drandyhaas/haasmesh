echo "<pre>"
if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 1 ]; then
  echo "Will flash node $1 "
  ssh 192.168.2.$1 "/root/script/flashled.sh"
else
  echo "Flash the LED from the master hub, not the node itself"
fi
echo "</pre>"
