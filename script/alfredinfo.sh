while true; do
 #echo "alfred info"
 /root/script/myip.sh | alfred -s 64
 if [ $? -eq 0 ]; then
  echo `/root/script/myip.sh` `date` | alfred -s 65
  echo `/root/script/myip.sh` `echo qqq` `ifconfig |grep HWaddr |sed s%$%qqq%g` | alfred -s 66
 else 
  /root/script/monstart.sh
 fi
 sleep 30
 /root/script/bathosts.sh
 cp /etc/bat-hosts /etc/ethers
 sleep 30
done

