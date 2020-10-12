
#pass in "-n" as an option to not keep config and reset to new factory default

cd /tmp
rm -f openwrt-*

if dmesg|grep -q "TP-Link Archer C7 v2"; then
echo "Getting Archer C7 v2 firmware"
wget -q --no-check-certificate https://www.dropbox.com/s/90ofp9s7llyrlxr/openwrt-ath79-generic-tplink_archer-c7-v2-squashfs-sysupgrade.bin
upfile="/tmp/openwrt-ath79-generic-tplink_archer-c7-v2-squashfs-sysupgrade.bin"
fi
if dmesg|grep -q "TP-Link Archer C7 v5"; then
echo "Getting Archer C7 v5 firmware"
wget -q --no-check-certificate https://www.dropbox.com/s/hb4qmjlduopgwyh/openwrt-ath79-generic-tplink_archer-c7-v5-squashfs-sysupgrade.bin
upfile="/tmp/openwrt-ath79-generic-tplink_archer-c7-v5-squashfs-sysupgrade.bin"
fi
if dmesg|grep -q "TP-Link Archer A7 v5"; then
echo "Getting Archer A7 v5 firmware"
wget -q --no-check-certificate https://www.dropbox.com/s/cs309z2h3mo46hn/openwrt-ath79-generic-tplink_archer-a7-v5-squashfs-sysupgrade.bin
upfile="/tmp/openwrt-ath79-generic-tplink_archer-a7-v5-squashfs-sysupgrade.bin"
fi
if dmesg|grep -q "Linksys EA8300"; then
echo "Getting Linksys EA8300 firmware"
wget -q --no-check-certificate https://www.dropbox.com/s/n5q1o8bd6pezaic/openwrt-ipq40xx-generic-linksys_ea8300-squashfs-sysupgrade.bin
upfile="/tmp/openwrt-ipq40xx-generic-linksys_ea8300-squashfs-sysupgrade.bin"
fi
if dmesg|grep -q "COMFAST CF-EW72"; then
echo "Getting COMFAST EW72 firmware"
wget -q --no-check-certificate https://www.dropbox.com/s/o3zmy96wxjp4v5m/openwrt-ath79-generic-comfast_cf-ew72-squashfs-sysupgrade.bin
upfile="/tmp/openwrt-ath79-generic-comfast_cf-ew72-squashfs-sysupgrade.bin"
fi
if dmesg|grep -q "Luma WRTQ-329ACN"; then
echo "Getting Luma WRTQ-329ACN firmware"
wget -q --no-check-certificate https://www.dropbox.com/s/ma18jja6zi5na8a/openwrt-ipq40xx-generic-luma_wrtq-329acn-squashfs-sysupgrade.bin
upfile="/tmp/openwrt-ipq40xx-generic-luma_wrtq-329acn-squashfs-sysupgrade.bin"
fi

echo "Upgrading with -v $1 in 10 seconds"
(sleep 10 && sysupgrade -v $1 $upfile && echo "date `date`">/tmp/updatefirmware.txt ) &

cd -
