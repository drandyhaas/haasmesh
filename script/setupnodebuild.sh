#git clone https://github.com/drandyhaas/haasmesh.git
mkdir -p files/root; cp haasmesh/script files/root/
mkdir -p files/etc; cp haasmesh/etc/profile haasmesh/etc/rc.local files/etc/
mkdir -p files/usr/lib/lua/luci/controller/myapp; cp haasmesh/haas_mesh_tab.lua files/usr/lib/lua/luci/controller/myapp/
mkdir -p files/usr/lib/lua/luci/view/myapp; cp haasmesh/monitor_tab.htm files/usr/lib/lua/luci/view/myapp/
mkdir -p files/etc/rc.button; cp haasmesh/etc/rc.button/reset haasmesh/etc/rc.button/wps files/etc/rc.button/
mkdir -p files/etc/hotplug.d/button; cp haasmesh/etc/hotplug.d/button/buttons files/etc/hotplug.d/button/
