
#this is the first row
echo "<table><tr>   <th><h3 style="text-align:center">Google</h3></th>   <th><h3 style="text-align:center">OpenWRT</h3></th>   </tr>"

#this is the second row
echo "<tr>"
  echo "<th>"
  i1=`ping -c 2 -W 4 google.com `
  #echo "<pre> $i1 </pre>"
  res=`echo "$i1" | grep -c "2 packets received" `
  #echo $res
  echo "<p style=\"text-align:center\">"
  if [ $res != 1 ]; then echo "<span class=\"reddot\"></span>";
  else echo "<span class=\"greendot\"></span>"; fi
  echo "<br>`echo "$i1" | grep "round-trip" | cut -d = -f 2 | cut -d / -f 2` ms"
  echo "</th>"

  echo "<th>"
  i1=`ping -c 2 -W 4 openwrt.org `
  #echo "<pre> $i1 </pre>"
  res=`echo "$i1" | grep -c "2 packets received" `
  #echo $res
  echo "<p style=\"text-align:center\">"
  if [ $res != 1 ]; then echo "<span class=\"reddot\"></span>";
  else echo "<span class=\"greendot\"></span>"; fi
  echo "<br>`echo "$i1" | grep "round-trip" | cut -d = -f 2 | cut -d / -f 2` ms"
  echo "</th>"
echo "</tr>"

#that is the end
echo "</table>"
echo "Pings to each location shown"

