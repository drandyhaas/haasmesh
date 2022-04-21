# haasmesh
Scripts and other files for the Haas Mesh OpenWRT system

Documentation: https://tinyurl.com/MaxwellMeshDoc

eBay: https://www.ebay.com/sch/i.html?_nkw=maxwell+mesh+wifi

To add to openWRT build:
<pre>
cd openwrt
git clone https://github.com/drandyhaas/haasmesh.git
haasmesh/script/setupnodebuild.sh [luma|ea8300|ew72|c7v2|c7v5|jetstream|redmi|rt3200]
cat etc/config/diffconfig_rt3200 >> .config #Append changes to bottom of .config #TODO: support build targets other than rt3200
make defconfig #Apply changes
date > files/etc/config/sysupgrade.version.txt
make -j6
</pre>
