
echo "<table><tr> <th><h3>Google.com</h3></th> <th><h3>Amazon.com</h3></th> <th><h3>OpenWRT.org</h3></th> </tr>"
  echo "<tr><th>"
  ping -c 2 -W 4 google.com > /root/internet.log
  res=`grep -c "bytes from" /root/internet.log`
  if [ $res != 2 ]; then echo "<span class="reddot"></span>";
  else echo "<span class="greendot"></span>"; fi
  echo "&nbsp;&nbsp;`grep round-trip /root/internet.log | cut -d = -f 2 | cut -d / -f 2` ms"

  echo "</th><th>"
  ping -c 2 -W 4 amazon.com > /root/internet.log
  res=`grep -c "bytes from" /root/internet.log`
  if [ $res != 2 ]; then echo "<span class="reddot"></span>"; 
  else echo "<span class="greendot"></span>"; fi
  echo "&nbsp;&nbsp;`grep round-trip /root/internet.log | cut -d = -f 2 | cut -d / -f 2` ms"

  echo "</th><th>"
  ping -c 2 -W 4 openwrt.org > /root/internet.log
  res=`grep -c "bytes from" /root/internet.log`
  if [ $res != 2 ]; then echo "<span class="reddot"></span>";
  else echo "<span class="greendot"></span>"; fi
  echo "&nbsp;&nbsp;`grep round-trip /root/internet.log | cut -d = -f 2 | cut -d / -f 2` ms"

  echo "</th></tr>"
echo "</table>"
echo "Pings to each location shown"

rm /root/internet.log
