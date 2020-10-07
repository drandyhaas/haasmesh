time -f "%E real time" wget http://ping.online.net/10Mo.dat -T 2 -O - 2>&1 > /dev/null | grep -v "\.\.\.\." | grep -v STDOUT | sed '/^$/d'
