
if [ `ps|grep -c alfredinfo` -eq 2 ]; then
  echo "alfredinfo already running"
else
  echo "start alfredinfo"
  /root/script/alfredinfo.sh &> /root/alfredinfo.log &
fi

if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 19 ]; then
  echo "Im a newbie, looking for a parent"
  if [ `ps|grep -c lookforparent` -eq 2 ]; then
    echo "lookforparent already running"
  else
    echo "start lookforparent"
    /root/script/lookforparent.sh &> /root/lookforparent.log &
  fi
fi

