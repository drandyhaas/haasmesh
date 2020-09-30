cd /root
rm -f d.test
time -f "%E real time" wget http://ping.online.net/10Mo.dat -T 2 -O - > /dev/null 2&> d.test
cat d.test
rm d.test
