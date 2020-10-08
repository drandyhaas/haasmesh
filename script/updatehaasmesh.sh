cd /root;

if opkg list-installed | grep -q git-http; then
cd haasmesh
git pull
cd -

else

if opkg list-installed | grep -q unzip; then
echo "got zip"
else
opkg update > /dev/null
opkg install unzip
opkg install wget
fi

wget -q --no-check-certificate https://github.com/drandyhaas/haasmesh/archive/master.zip;
unzip master.zip > /dev/null ; 
rm -rf haasmesh
mv haasmesh-master haasmesh
rm master.zip

fi

haasmesh/script/setupnode.sh

cd -
