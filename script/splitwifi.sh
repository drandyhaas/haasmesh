n=`/root/script/myip.sh | cut -f 4 -d . `
uci set wireless.ap_2g_1.ssid="HaasMeshWifi2g_w$n"
uci set wireless.ap_5g_1.ssid="HaasMeshWifi5g_w$n"
uci set wireless.ap_5g_2.ssid="HaasMeshWifi5g2_w$n"
uci changes
uci commit
wifi
