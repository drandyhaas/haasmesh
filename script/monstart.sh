
killall alfred
killall batadv-vis
kill `ps|grep alf|grep -v grep|cut -d r -f 1`

if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 1 ]; then
  echo "master hub"
  ALFREDMASTER="-m "
else
  echo "just a node"
fi

alfred $ALFREDMASTER -i br-lan &> /dev/null &  # and -m for master on hub
batadv-vis -i bat0 -s &> /root/batadv-vis.log &
/root/script/alfredinfo.sh &> /root/alfredinfo.log &

if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 19 ]; then
  echo "Im a newbie, looking for a parent"
  /root/script/lookforparent.sh &> /root/lookforparent.log &
fi

