#4 threads, 1 second, json output
x=`iperf3 $2 -P 4 -t 1 -J -c $1 | grep bits_per_second | tail -1 | cut -f 2 -d ':' | cut -f 1 -d '.' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
echo -n " "
echo -n `echo "print(string.format(\"%.2f\",$x/1000000))" |lua`
echo " Mb/s"
