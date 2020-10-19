
#pass in "-n" as an option to not keep config and reset to new factory default

cd /tmp
rm -f openwrt-*

#assume we'll get the new firmware
getnew=1
#assume not checking version
docheck=1

if cat /sys/firmware/devicetree/base/model |grep -q "TP-Link Archer C7 v2"; then
echo "Getting Archer C7 v2 firmware"
filedir="https://www.dropbox.com/s/90ofp9s7llyrlxr"
file="openwrt-ath79-generic-tplink_archer-c7-v2-squashfs-sysupgrade.bin"
fi
if cat /sys/firmware/devicetree/base/model |grep -q "TP-Link Archer C7 v5"; then
echo "Getting Archer C7 v5 firmware"
filedir="https://www.dropbox.com/s/hb4qmjlduopgwyh"
file="openwrt-ath79-generic-tplink_archer-c7-v5-squashfs-sysupgrade.bin"
fi
if cat /sys/firmware/devicetree/base/model |grep -q "TP-Link Archer A7 v5"; then
echo "Getting Archer A7 v5 firmware"
filedir="https://www.dropbox.com/s/cs309z2h3mo46hn"
file="openwrt-ath79-generic-tplink_archer-a7-v5-squashfs-sysupgrade.bin"
fi
if cat /sys/firmware/devicetree/base/model |grep -q "Linksys EA8300"; then
echo "Getting Linksys EA8300 firmware"
filedir="https://www.dropbox.com/s/n5q1o8bd6pezaic"
file="openwrt-ipq40xx-generic-linksys_ea8300-squashfs-sysupgrade.bin"
fi
if cat /sys/firmware/devicetree/base/model |grep -q "COMFAST CF-EW72"; then
echo "Getting COMFAST EW72 firmware"
filedir="https://www.dropbox.com/s/o3zmy96wxjp4v5m"
file="openwrt-ath79-generic-comfast_cf-ew72-squashfs-sysupgrade.bin"
fi
if cat /sys/firmware/devicetree/base/model |grep -q "Luma WRTQ-329ACN"; then
echo "Getting Luma WRTQ-329ACN firmware"
filedir="https://www.dropbox.com/s/ma18jja6zi5na8a"
file="openwrt-ipq40xx-generic-luma_wrtq-329acn-squashfs-sysupgrade.bin"
fi
if cat /sys/firmware/devicetree/base/model |grep -q "Xiaomi Redmi Router AC2100"; then
echo "Getting Xiaomi Redmi Router AC2100 firmware"
filedir="https://www.dropbox.com/s/dzkgrcm3cgdzkzf"
file="openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100-squashfs-sysupgrade.bin"
fi

if cat /sys/firmware/devicetree/base/model |grep -q "Wavlink WL-WN531A6"; then
echo "Checking for new Wavlink WL-WN531A6 firmware"
filedir="https://www.dropbox.com/s/aumhhccy9qbdfxs"
file="openwrt-ramips-mt7621-wavlink_wl-wn531a6-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/m4svlvmiuzin61j"
vfile="openwrt-ramips-mt7621-wavlink_wl-wn531a6-squashfs-sysupgrade.version.txt"
docheck=1
fi

if [ $docheck -eq 1 ]; then
 wget -q --no-check-certificate $vfiledir/$vfile
 if diff $vfile /www/sysupgrade.version.txt; then
  rm $vfile
  echo "No new firmware"
  getnew=0
 else
  mv -v $vfile /www/sysupgrade.version.txt
 fi
fi

if [ $getnew -eq 1 ]; then 
 echo "Getting new firmware"
 wget -q --no-check-certificate $filedir/$file
 echo "Upgrading with -v $1 $file in 30 seconds"
 (sleep 30 && sysupgrade -v $1 $file > /tmp/updatefirmware.txt && echo "date `date`">/tmp/updatefirmwaredate.txt ) &
fi

cd -
