cd /root

#try to make link
ln -fs /root/haasmesh/script /root/script
if [[ -L /root/script && -d /root/script ]]; then 
  echo "script is a link";
else
  echo "could not make script link, so copying"
  cp -r haasmesh/script ./
fi

#don't ask
rm -f script/script

cp -r haasmesh/etc/* /etc/
mkdir -p /usr/lib/lua/luci/controller/myapp; ln -fs /root/haasmesh/haas_mesh_tab.lua  /usr/lib/lua/luci/controller/myapp/haas_mesh_tab.lua
mkdir -p /usr/lib/lua/luci/view/myapp; ln -fs /root/haasmesh/monitor_tab.htm /usr/lib/lua/luci/view/myapp/monitor_tab.htm
cp haasmesh/newhaasnode /www/cgi-bin/
cp -r haasmesh/springy /www/
cp -r haasmesh/node_modules /www/
ln -fs /root/haasmesh/dotbottom.html /www/dotbottom.html
ln -fs /root/haasmesh/dottop.html /www/dottop.html
cp haasmesh/index.html /www/
cd -

echo "starting monitoring"
ash /root/script/monstart.sh
