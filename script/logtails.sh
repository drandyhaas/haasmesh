for n in `/root/script/nodes.sh`; do echo; echo $n; ssh $n "logread|tail"; echo; done

