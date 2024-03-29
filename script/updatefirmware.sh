
#pass in "-n" as an option to not keep config and reset to new factory default

cd /tmp
rm -f openwrt-*

#assume we'll get the new firmware
getnew=1
#assume not checking version
docheck=0

if cat /sys/firmware/devicetree/base/model |grep -q "TP-Link Archer C7 v2"; then
echo "Getting Archer C7 v2 firmware"
filedir="https://www.dropbox.com/s/90ofp9s7llyrlxr"
file="openwrt-ath79-generic-tplink_archer-c7-v2-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/un1zbih4952v68k/"
vfile="openwrt-ath79-generic-tplink_archer-c7-v2-squashfs-sysupgrade.version.txt"
docheck=1
fi
if cat /sys/firmware/devicetree/base/model |grep -q "TP-Link Archer C7 v4"; then
echo "Getting Archer C7 v4 firmware"
filedir="https://www.dropbox.com/s/h7wat4axo8ntczh"
file="openwrt-ath79-generic-tplink_archer-c7-v4-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/7ud546nmmruxj0v/"
vfile="openwrt-ath79-generic-tplink_archer-c7-v4-squashfs-sysupgrade.version.txt"
docheck=1
fi
if cat /sys/firmware/devicetree/base/model |grep -q "TP-Link Archer C7 v5"; then
echo "Getting Archer C7 v5 firmware"
filedir="https://www.dropbox.com/s/hb4qmjlduopgwyh"
file="openwrt-ath79-generic-tplink_archer-c7-v5-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/nhvnqkwj8jt3vxg/"
vfile="openwrt-ath79-generic-tplink_archer-c7-v5-squashfs-sysupgrade.version.txt"
docheck=1
fi
if cat /sys/firmware/devicetree/base/model |grep -q "TP-Link Archer A7 v5"; then
echo "Getting Archer A7 v5 firmware"
filedir="https://www.dropbox.com/s/cs309z2h3mo46hn"
file="openwrt-ath79-generic-tplink_archer-a7-v5-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/7kf8h836ovn00ts/"
vfile="openwrt-ath79-generic-tplink_archer-a7-v5-squashfs-sysupgrade.version.txt"
docheck=1
fi

if cat /sys/firmware/devicetree/base/model |grep -q "Linksys EA8300"; then
echo "Getting Linksys EA8300 firmware"
filedir="https://www.dropbox.com/s/n5q1o8bd6pezaic"
file="openwrt-ipq40xx-generic-linksys_ea8300-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/yw6isf476o872ds/"
vfile="openwrt-ipq40xx-generic-linksys_ea8300-squashfs-sysupgrade.version.txt"
docheck=1
fi

if cat /sys/firmware/devicetree/base/model |grep -q "COMFAST CF-EW72"; then
echo "Getting COMFAST EW72 firmware"
filedir="https://www.dropbox.com/s/o3zmy96wxjp4v5m/"
file="openwrt-ath79-generic-comfast_cf-ew72-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/jw48vook3cudl35/"
vfile="openwrt-ath79-generic-comfast_cf-ew72-squashfs-sysupgrade.version.txt"
docheck=1
fi

if cat /sys/firmware/devicetree/base/model | grep -q "Compex WPJ419 Haas"; then
filedir="https://www.dropbox.com/s/wzu97fbm5hlams3/"
file="openwrt-ipq40xx-generic-compex_wpj419-squashfs-nand-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/zt19o7uk0iztotj/"
vfile="openwrt-ipq40xx-generic-compex_wpj419-squashfs-nand-sysupgrade.version.txt"
docheck=1
fi

if cat /sys/firmware/devicetree/base/model |grep -q "WRTQ-329ACN"; then
echo "Getting Luma WRTQ-329ACN firmware"
filedir="https://www.dropbox.com/s/ma18jja6zi5na8a"
file="openwrt-ipq40xx-generic-luma_wrtq-329acn-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/6ge8gvnx0cl3ciz/"
vfile="openwrt-ipq40xx-generic-luma_wrtq-329acn-squashfs-sysupgrade.version.txt"
docheck=1
fi

if cat /sys/firmware/devicetree/base/model |grep -q "Xiaomi Redmi Router AC2100"; then
echo "Checking for new Xiaomi Redmi Router AC2100 firmware"
filedir="https://www.dropbox.com/s/dzkgrcm3cgdzkzf"
file="openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/p5jgqgnek75pb19/"
vfile="openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100-squashfs-sysupgrade.version.txt"
docheck=1
fi
if cat /sys/firmware/devicetree/base/model |grep -q "Wavlink WL-WN531A6"; then
echo "Checking for new Wavlink WL-WN531A6 firmware"
filedir="https://www.dropbox.com/s/aumhhccy9qbdfxs"
file="openwrt-ramips-mt7621-wavlink_wl-wn531a6-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/m4svlvmiuzin61j/"
vfile="openwrt-ramips-mt7621-wavlink_wl-wn531a6-squashfs-sysupgrade.version.txt"
docheck=1
fi

if cat /sys/firmware/devicetree/base/model |grep -q "Xiaomi AX3600"; then
echo "Getting Xiaomi AX3600 firmware"
filedir="https://www.dropbox.com/s/ysb0jdpz5gcv8hc/"
file="openwrt-ipq807x-generic-xiaomi_ax3600-squashfs-nand-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/8x91bz8iu0x0jai/"
vfile="openwrt-ax3600-sysupgrade.version.txt"
docheck=1
fi

if cat /sys/firmware/devicetree/base/model |grep -q "Linksys E8450"; then
echo "Getting Linksys E8450 (or Belkin RT3200) firmware"
filedir="https://www.dropbox.com/s/d80goyl79ykdxkp/"
file="openwrt-mediatek-mt7622-linksys_e8450-ubi-squashfs-sysupgrade.itb"
vfiledir="https://www.dropbox.com/s/cjgp2bpcoq6vk9a/"
vfile="openwrt-rt3200-sysupgrade.version.txt"
docheck=1
fi

if cat /sys/firmware/devicetree/base/model |grep -q "Linksys MR8300"; then # MR8300 is used for MR9000 device, EA8300 is used for MR8300 device
echo "Getting Linksys MR9000 firmware"
filedir="https://www.dropbox.com/s/n4668an40tf4hvc/"
file="openwrt-ipq40xx-generic-linksys_mr9000-squashfs-sysupgrade.bin"
vfiledir="https://www.dropbox.com/s/ic18e48qlgp3he4/"
vfile="openwrt-ipq40xx-generic-linksys_mr9000-squashfs-sysupgrade.version.txt"
docheck=1
fi

if [ $docheck -eq 1 ]; then
 wget -q --no-check-certificate $vfiledir/$vfile
 if diff $vfile /etc/config/sysupgrade.version.txt; then
  rm $vfile
  echo "No new firmware"
  getnew=0
 else
  mv -v $vfile /etc/config/sysupgrade.version.txt
 fi
fi

if [ $getnew -eq 1 ]; then 
 echo "Getting new firmware $filedir/$file"
 wget -q --no-check-certificate $filedir/$file
 echo "Upgrading with -v $1 $file in 30 seconds"
 sync
 (sleep 30 && sysupgrade -v $1 $file &> /tmp/updatefirmware.txt && echo "date `date`" &> /tmp/updatefirmwaredate.txt ) &
fi

cd -
