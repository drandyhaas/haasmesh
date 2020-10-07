cd /root
mv haasmesh/.git ./haasmesh.git
for n in `/root/script/nodes.sh`; do 
echo; echo ${n}
if [ $n == `/root/script/myip.sh` ]; then continue; fi
scp -r haasmesh $n: ; ssh $n "haasmesh/script/setupnode.sh"
done
mv haasmesh.git haasmesh/.git
cd -
