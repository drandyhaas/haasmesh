#make /www/allnodes.txt
/root/script/allnodes.sh

#make /etc/bat-hosts
alfred -r 66 |sed "s%qqq%\n%g" | grep "{\|HWaddr" > /tmp/alfmacs.txt
echo -n "" > /etc/bat-hosts # clear the old file
while read p; do
  #echo $p
  echo $p | grep { > /dev/null
  if [ $? -eq 0 ]; then
   #mac=`echo "$p" | cut -d " " -f 2 |sed 's%\"%%' | sed 's%\",%%' `
   ip=`echo "$p" | cut -d " " -f 3 |sed 's%\"%%' `
   ipn=97 # will be an "a"
   #echo $mac $ip
  else
   mac=`echo $p | cut -d " " -f 5`
   #check if we already seen this mac
   grep $mac /etc/bat-hosts > /dev/null
   if [ $? -eq 0 ]; then
     true
   else
     ipnc=`printf '%b' $(printf '\\%03o' $ipn )` # adds the character "a b c ... "
     echo $mac ${ipnc}-${ip} >> /etc/bat-hosts
     let "ipn=ipn+1"
     if [ $ipn -gt 122 ]; then ipn=65; fi; #when we run out of lowercase, start using capital A B C ... 
     if [ $ipn -eq 91 ]; then ipn=97; fi; #don't use special characters, start back with a b c ...
   fi
  fi
done < /tmp/alfmacs.txt
