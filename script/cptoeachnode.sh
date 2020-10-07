myip=`/root/script/myip.sh`
if [ `echo $myip | cut -f 4 -d . ` -eq 1 ]; then
 echo "Send \"${1}\" to directory \"${2}\" on each node"
 for n in `/root/script/nodes.sh`; do 
  if [ $n == $myip ]; then continue; fi # don't send to myself
  echo; echo ${n}:; scp $1 ${n}:${2} ; done
 echo
else
 echo "Just a node, so do nuttin"
fi
