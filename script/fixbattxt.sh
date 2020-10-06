
batadv-vis -f jsondoc > /root/bat.txt

/root/script/bathosts.sh

while read p; do
  mac=`echo $p | cut -d " " -f 1`
  ip=`echo $p | cut -d " " -f 2`
  #echo $mac - $ip
  sed -i "s%$mac%$mac $ip%gi" /root/bat.txt 
done < /etc/bat-hosts

while read p; do
  mac=`echo $p | cut -d " " -f 2 `
  ip=`echo "$p" | cut -d " " -f 3-4 `
  #echo $mac - $ip
  sed -i "s%$mac%$mac $ip%gi" /root/bat.txt
done < /tmp/dhcp.leases

#make it friendly for javascript
sed -e 's%$%\ \\%' -i /root/bat.txt # add a \ at the end of each line
echo -n "var txt = '"; cat /root/bat.txt; echo "'" # add the surrounding var text

echo -n "var txt2 = '"; echo -n `alfred -r 67`; echo "'" # the wifi strengths

rm /root/bat.txt
