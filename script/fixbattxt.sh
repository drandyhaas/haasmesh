
batadv-vis -f jsondoc > /root/bat.txt

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

sed -e 's%$%\ \\%' -i /root/bat.txt
echo -n "var txt = '"; cat /root/bat.txt; echo "'" 
rm /root/bat.txt
