cd /root
mv haasmesh/.git ./haasmesh.git
for n in `/root/script/nodes.sh`; do 
echo; echo ${n}
scp -r haasmesh $n: ; ssh $n "haasmesh/script/setupnode.sh"
done
mv haasmesh.git haasmesh/.git
cd -