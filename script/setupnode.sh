cd /root
rm -rf script; cp -r haasmesh/script .
cp haasmesh/etc/profile haasmesh/etc/rc.local /etc/
mkdir -p /usr/lib/lua/luci/controller/myapp; ln -fs /root/haasmesh/haas_mesh_tab.lua  /usr/lib/lua/luci/controller/myapp/haas_mesh_tab.lua
mkdir -p /usr/lib/lua/luci/view/myapp; ln -fs /root/haasmesh/monitor_tab.htm /usr/lib/lua/luci/view/myapp/monitor_tab.htm
cp haasmesh/etc/rc.button/reset haasmesh/etc/rc.button/wps /etc/rc.button/
mkdir -p /etc/hotplug.d/button; cp haasmesh/etc/hotplug.d/button/buttons /etc/hotplug.d/button/
cp haasmesh/newhaasnode /www/cgi-bin/
cp -r haasmesh/springy /www/
cp -r haasmesh/node_modules /www/
ln -fs haasmesh/dotbottom.html /www/dotbottom.html
ln -fs haasmesh/dottop.html /www/dottop.html
cp haasmesh/index.html /www/
cd -
ash script/monstart.sh
