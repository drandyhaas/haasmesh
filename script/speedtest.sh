#no progress, and remove special characters and empty lines
ssh `/root/script/myip.sh` "/root/script/speedtest -p no " | sed $'s/[^[:print:]\t]//g' | sed '/^$/d'