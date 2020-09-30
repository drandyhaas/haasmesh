batctl n 2>&1 |grep Error > /dev/null
if [ $? -eq 0 ]; then
#not a bat node
route|grep default|cut -d " " -f 10
else
alfred -r 64 | cut -d '"' -f 4 | cut -d \\ -f 1 | sort
fi
