for i in $(seq 1 255) ; do echo $i; /root/script/pingip.sh 192.168.2.$i ; done | grep seq=0 
