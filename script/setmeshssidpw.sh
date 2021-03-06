
if [ $# -lt 2 ]; then echo "have to enter 2 arguments, an ssid and pw"; exit; fi
if [ `expr length $2` -gt 63 ]; then echo "pw too long - has to be at most 63 characters"; exit; fi
if [ `expr length $2` -lt 8 ]; then echo "pw too short - has to be at least 8 characters"; exit; fi

if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 1 ]; then
echo "master hub"

for n in `/root/script/nodes.sh`; do
   if [ $n == "192.168.2.19" ]; then echo "skipping 192.168.2.19"; continue; fi # don't try to do this dummy node
   echo "Setting mesh ssid to \"${1}\" and pw to \"${2}\" for node $n "
   ssh $n "uci set wireless.mesh0.mesh_id=\"${1}\"; uci set wireless.mesh0.key=\"${2}\"; uci changes; uci commit; /root/script/wifi10s.sh &"
done

else
echo "just a node"

   echo "Setting mesh ssid to \"${1}\" and pw to \"${2}\" for me"
   uci set wireless.mesh0.mesh_id="${1}"
   uci set wireless.mesh0.key="${2}"
   uci changes
   uci commit
   wifi

fi
