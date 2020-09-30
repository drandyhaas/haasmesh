if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 1 ]; then
echo "master hub"

if [ $# -lt 2 ]; then echo "have to enter 2 arguments, an ssid and pw"; exit; fi
if [ `expr length $2` -gt 63 ]; then echo "pw too long - has to be at most 63 characters"; exit; fi
if [ `expr length $2` -lt 8 ]; then echo "pw too short - has to be at least 8 characters"; exit; fi

for n in 19; do n="192.168.2.$n"
#for n in `/root/script/nodes.sh` 192.168.2.2 192.168.2.7; do
   echo "Setting ssid to \"${1}\" and pw to \"${2}\" for node $n "
   ssh $n "uci set wireless.ap_2g_1.ssid=\"${1}\"; uci set wireless.ap_2g_1.key=\"${2}\"; uci set wireless.ap_5g_1.ssid=\"${1}\"; uci set wireless.ap_5g_1.key=\"${2}\"; uci set wireless.ap_5g_2.ssid=\"${1}\"; uci set wireless.ap_5g_2.key=\"${2}\";uci commit; wifi"
done

else
echo "just a node"
fi
