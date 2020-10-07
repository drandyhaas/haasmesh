if [ -d haasmesh ]; then
mv haasmesh/.git ./haasmesh.git
echo; echo "Setting up new node $1 "
scp -o "StrictHostKeyChecking=no" -r haasmesh root@${1}:
ssh -o "StrictHostKeyChecking=no" root@${1} "haasmesh/script/setupnode.sh"
mv haasmesh.git haasmesh/.git
else
echo "haasmesh directory not found"
fi
