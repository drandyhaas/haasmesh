if [ -f /usr/bin/speedtest ]; then
speedtest --no-pre-allocate --no-upload
speedtest --no-pre-allocate --no-download
else
echo "To install: (takes about 15MB, so make sure you have room!)"
echo "opkg update"
echo "opkg install python-pip"
echo "pip install speedtest-cli"
fi
