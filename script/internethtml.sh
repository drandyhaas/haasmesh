
#this is the first row
echo "<table><tr> <th>Location</th> <th>Google</th> <th>OpenWRT</th> </tr>"

#this is the second row
echo "<tr>"

  echo "<th>Pings</th>"

  echo "<th>"
  i1=`ping -c 2 -W 4 google.com `
  #echo "<pre> $i1 </pre>"
  res=`echo "$i1" | grep -c "2 packets received" `
  #echo $res
  if [ $res != 1 ]; then echo "<span class=\"reddot\"></span>";
  else echo "<span class=\"greendot\"></span>"; fi
  echo " &nbsp `echo "$i1" | grep "round-trip" | cut -d = -f 2 | cut -d / -f 2` ms"
  echo "</th>"

  echo "<th>"
  i1=`ping -c 2 -W 4 openwrt.org `
  #echo "<pre> $i1 </pre>"
  res=`echo "$i1" | grep -c "2 packets received" `
  #echo $res
  if [ $res != 1 ]; then echo "<span class=\"reddot\"></span>";
  else echo "<span class=\"greendot\"></span>"; fi
  echo " &nbsp `echo "$i1" | grep "round-trip" | cut -d = -f 2 | cut -d / -f 2` ms"
  echo "</th>"

echo "</tr>"

#that is the end
echo "</table>"
