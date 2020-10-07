if [ `/root/script/myip.sh | cut -f 4 -d . ` -eq 1 ]; then
 echo "Do \"${1}\" on each node"
 for n in `/root/script/nodes.sh`; do echo; echo ${n}:; ssh $n "${1}"; done
 echo
else
 echo "Just a node, so will do \"${1}\" on only myself"
 ash -c $1
 echo
fi
