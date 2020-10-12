if [ -f /usr/bin/speedtest ]; then
  speedtest --no-pre-allocate --no-upload
  speedtest --no-pre-allocate --no-download
else
  if [ `/root/script/freespace.sh` -gt 25000 ]; then
    echo "Installing python and speedtest"
    opkg update
    opkg install python3-pip
    pip install speedtest-cli
  else
    echo "Needs about 15MB of flash space, and you have less than 25MB available"
  fi
fi
