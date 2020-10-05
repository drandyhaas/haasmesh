while true; do
 #echo "alfred info"
 /root/script/myip.sh | alfred -s 64
 if [ $? -eq 0 ]; then
  echo `/root/script/myip.sh` `date` | alfred -s 65
  echo `/root/script/myip.sh` `echo qqq` `ifconfig |grep HWaddr |sed s%$%qqq%g` | alfred -s 66
  iwinfo mesh0 assoclist 2>&1 | grep SNR | grep dBm | cut -d / -f 1 | alfred -s 67
  iwinfo wlan1 assoclist 2>&1 | grep SNR | grep dBm | cut -d / -f 1 | alfred -s 68
  iwinfo wlan2 assoclist 2>&1 | grep SNR | grep dBm | cut -d / -f 1 | alfred -s 69
  iwinfo | grep ESSID | alfred -s 70
  iwinfo | grep Channel | alfred -s 71
 else
  /root/script/monstart.sh
 fi
 sleep 30
 /root/script/bathosts.sh
 cp /etc/bat-hosts /etc/ethers
 sleep 30
done

