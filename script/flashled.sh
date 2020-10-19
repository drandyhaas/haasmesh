
#pass in seconds to flash for
if [ $# -eq 0 ]; then # no args
 nsec=10
else
 nsec=$1
fi

if dmesg|grep -q "TP-Link Archer C7 v2"; then
led="none"
fi
if dmesg|grep -q "TP-Link Archer C7 v5"; then
led="none"
fi
if dmesg|grep -q "TP-Link Archer A7 v5"; then
led="none"
fi
if dmesg|grep -q "Linksys EA8300"; then
led="none"
fi
if dmesg|grep -q "COMFAST CF-EW72"; then
led="none"
fi
if dmesg|grep -q "Wavlink WL-WN531A6"; then
led=/sys/class/leds/blue\:wifi2g
fi
if dmesg|grep -q "Xiaomi Redmi Router AC2100"; then
led=/sys/class/leds/white\:status
fi

if dmesg|grep -q "Luma WRTQ-329ACN"; then
led="none"
echo "flashing luma led ring for 2x$nsec sec"
for i in $(seq 0 $nsec); do
 i2cset -y 2 0x48 3 5 12 0 i # set luma led ring to solid purple bright
 sleep 1
 i2cset -y 2 0x48 3 5 1 0 i # set luma led ring to solid purple dim
 sleep 1
done
fi

if [ $led != "none" ]; then
echo "flashing led for 2x$nsec sec"
echo none > $led/trigger
for i in $(seq 0 $nsec); do
 echo 1 > $led/brightness
 sleep 1
 echo 0 > $led/brightness
 sleep 1
done
fi
