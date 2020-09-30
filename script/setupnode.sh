if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 1 ]; then
   echo "master hub"
else
   echo "just a node"
fi

cd /root
#git clone https://github.com/drandyhaas/haasmesh.git
rm script; ln -s haasmesh/script
cp haasmesh/etc/profile haasmesh/etc/rc.local /etc/
mkdir -p /usr/lib/lua/luci/controller/myapp; cp haasmesh/haas_mesh_tab.lua /usr/lib/lua/luci/controller/myapp/
mkdir -p /usr/lib/lua/luci/view/myapp; cp haasmesh/monitor_tab.htm /usr/lib/lua/luci/view/myapp/
cp haasmesh/etc/rc.button/reset haasmesh/etc/rc.button/wps /etc/rc.button/
mkdir -p /etc/hotplug.d/button; cp haasmesh/etc/hotplug.d/button/buttons /etc/hotplug.d/button/
cd -
ash script/monstart.sh

