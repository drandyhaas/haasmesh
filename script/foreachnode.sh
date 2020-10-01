echo "Do \"${1}\" on each node"
for n in `/root/script/nodes.sh`; do echo; echo ${n}:; ssh $n "${1}"; done
echo
