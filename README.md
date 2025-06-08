# haasmesh
Scripts and other files for the Haas Mesh OpenWRT system

Documentation: https://tinyurl.com/MaxwellMeshDoc

eBay: https://www.ebay.com/sch/i.html?_nkw=maxwell+mesh+wifi

First, add required packages to the openWRT build:
<pre>
make menuconfig
  
network -> alfred (with auto bat-hosts? ) batctl-full iperf3
network -> socat
network/wirelessAPD -> remove wpad-basic, install wpad-mesh-openssl
network/filetransfer -> wget
network/ssh -> openssh-client-utils
network/vpn -> openvpn-openssl
network -> banip
utilities/compression -> unzip
utilities/editors -> nano
utilities/bootloader -> uboot-envtools
kernel/network support-> kmod-batman-adv
kernel/network support-> kmod-tun (for tailscale VPN)
kernel/wireless drivers -> kmod-rt2800-usb (for alfa r36a)
firmware -> ath10k non-ct drivers and kmod-ath10k non-ct (for wave-1 devices only, like archer)
firmware -> ath10k-firmware-qca9888-ct (for ea8300)
development -> diffutils
luci, luci-app-commands, luci-app-openvpn, luci-app-banip
for luma also add:
  utilities -> i2c-tools, nand-utils, usbutils
  kernel/filesystems -> kmod-fs-exfat, kmod-fs-ext4, kmod-fs-vfat, kmod-usb-storage
</pre>

To add haasmesh to openWRT build:
<pre>
cd openwrt
git clone https://github.com/drandyhaas/haasmesh.git
haasmesh/script/setupnodebuild.sh [luma|ea8300|ew72|c7v2|c7v5|jetstream|redmi|rt3200]
cat etc/config/diffconfig_rt3200 >> .config #Append changes to bottom of .config #TODO: support build targets other than rt3200
make defconfig #Apply changes
date > files/etc/config/sysupgrade.version.txt
make -j6
</pre>

A full openWRT build with haasmesh:
<pre>
#git clone https://git.openwrt.org/openwrt/openwrt.git #fitst time
cd openwrt
git pull
#Select a specific code revision 
#git branch -a 
#git tag 
#git checkout v21.02.2
./scripts/feeds update -a
./scripts/feeds install -a
#make dirclean #to get rid of json.h error?
make menuconfig
#make kernel_menuconfig
#git clone https://github.com/drandyhaas/haasmesh.git #first time
cd haasmesh
git pull
cd ..
haasmesh/script/setupnodebuild.sh rt3200
cat haasmesh/etc/config/diffconfig_rt3200 >> .config #Append changes to bottom of .config
make defconfig #Apply changes
date > files/etc/config/sysupgrade.version.txt
make -j6
ls -ltr bin/targets/mediatek/mt7622/openwrt-mediatek-mt7622-linksys_e8450-ubi*.itb
</pre>
