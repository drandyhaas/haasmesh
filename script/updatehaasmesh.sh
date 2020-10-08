cd /root;

if opkg list-installed | grep -q git-http; then
cd haasmesh
git pull
cd -

else

wget --no-check-certificate https://github.com/drandyhaas/haasmesh/archive/master.zip;
if opkg list-installed | grep -q unzip; then
echo "got zip"
else
opkg update
opkg install unzip
fi
unzip master.zip; 
mv haasmesh-master haasmesh
rm master.zip

fi

haasmesh/script/setupnode.sh

cd -
