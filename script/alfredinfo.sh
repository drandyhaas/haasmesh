while true; do
 #echo "alfred info"
 /root/script/myip.sh | alfred -s 64
 if [ $? -eq 0 ]; then
  echo `/root/script/myip.sh` `date` | alfred -s 65
  echo `/root/script/myip.sh` `echo qqq` `ifconfig |grep HWaddr |sed s%$%qqq%g` | alfred -s 66
  for w in `iwinfo |grep ESSID|cut -d " " -f 1`; do echo -n "$w = "; echo -n `iwinfo $w info | grep Channel`; echo -n " = "; echo `iwinfo $w assoclist | grep SNR | grep dBm | cut -d / -f 1`; done | alfred -s 67
 else
  /root/script/monstart.sh
 fi
 sleep 30
 /root/script/bathosts.sh
 cp /etc/bat-hosts /etc/ethers
 sleep 30
done

