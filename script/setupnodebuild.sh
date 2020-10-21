#git clone https://github.com/drandyhaas/haasmesh.git
rm -rf files
mkdir -p files/etc
cp -r haasmesh/etc/* files/etc/
cp haasmesh/etc/config/wireless_$1 files/etc/config/wireless
cp haasmesh/etc/config/network_$1 files/etc/config/network
mkdir -p files/root; cp -r haasmesh/script files/root/
mkdir -p files/usr/lib/lua/luci/controller/myapp; cp haasmesh/haas_mesh_tab.lua files/usr/lib/lua/luci/controller/myapp/
mkdir -p files/usr/lib/lua/luci/view/myapp; cp haasmesh/monitor_tab.htm files/usr/lib/lua/luci/view/myapp/
mkdir -p files/www/cgi-bin; cp haasmesh/newhaasnode files/www/cgi-bin/
cp -r haasmesh/springy files/www/
cp -r haasmesh/node_modules files/www/
cp haasmesh/dotbottom.html haasmesh/dottop.html files/www/
cp haasmesh/index.html files/www/
