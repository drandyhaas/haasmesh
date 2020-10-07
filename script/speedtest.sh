#No clue why you have to ssh to yourself to get this to print in the webpage!
ssh `/root/script/myip.sh ` "speedtest-netperf.sh -t 5 -n 2 -H netperf.bufferbloat.net | grep -E Measure\|load "
