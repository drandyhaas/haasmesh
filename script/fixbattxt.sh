
batadv-vis > /root/bat.txt

/root/script/bathosts.sh

while read p; do
  mac=`echo $p | cut -d " " -f 1`
  ip=`echo $p | cut -d " " -f 2`
  #echo $mac - $ip
  sed -i "s%$mac%$ip%gi" /root/bat.txt 
done < /etc/bat-hosts

while read p; do
  mac=`echo $p | cut -d " " -f 2 `
  ip=`echo "$p" | cut -d " " -f 3-4 `
  #echo $mac - $ip
  sed -i "s%$mac%$ip%gi" /root/bat.txt
done < /tmp/dhcp.leases

cat /root/bat.txt # | sed s%\".-192%\"192%g 
rm /root/bat.txt
