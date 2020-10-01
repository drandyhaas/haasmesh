#make /www/allnodes.txt
/root/script/allnodes.sh

#make /etc/bat-hosts
alfred -r 66 |sed "s%qqq%\n%g" | grep "{\|HWaddr" > /tmp/alfmacs.txt
rm /etc/bat-hosts
touch /etc/bat-hosts
while read p; do
  #echo $p
  echo $p | grep { > /dev/null
  if [ $? -eq 0 ]; then
   #mac=`echo "$p" | cut -d " " -f 2 |sed 's%\"%%' | sed 's%\",%%' `
   ip=`echo "$p" | cut -d " " -f 3 |sed 's%\"%%' `
   ipn=1
   #echo $mac $ip
  else
   mac=`echo $p | cut -d " " -f 5`
   #check if we already seen this mac
   grep $mac /etc/bat-hosts > /dev/null
   if [ $? -eq 0 ]; then
     true
   else
     echo $mac ${ipn}-${ip} >> /etc/bat-hosts
     let "ipn=ipn+1"
   fi
  fi
done < /tmp/alfmacs.txt
