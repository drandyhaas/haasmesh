if [ -f /usr/bin/speedtest ]; then
  rm -f /root/speedtest.log
  speedtest --no-pre-allocate --no-upload
  speedtest --no-pre-allocate --no-download
else
  if [ `/root/script/freespace.sh` -gt 25000 ]; then
    if [ -f /tmp/speedtestlock ]; then 
      echo "speedtest stuff still installing..."; echo
      cat /root/speedtest.log 
    else

      echo "Installing python and speedtest"
      echo "running" > /tmp/speedtestlock
      ( opkg update && opkg install python3-pip && pip install speedtest-cli && rm /tmp/speedtestlock ) &> /root/speedtest.log &

      #To uninstall:
      #pip uninstall speedtest-cli
      #opkg remove python* 
      #opkg remove python* 
      #opkg remove python* 
      #opkg remove python* 
      #opkg remove python* 

    fi
  else
    echo "Needs about 15MB of flash space, and you have less than 25MB available"
  fi
fi
