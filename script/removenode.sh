echo "<pre>"
echo "Will remove node $1 "
sed -i s/$/:/ /www/allnodes.txt # add a ":" at the end of each line temporarily, so we don't remove .34 as well as .3, for instance
sed -i "/192\.168\..*\.${1}:/d" /www/allnodes.txt # remove the line matching the ip
sed -i s/:// /www/allnodes.txt # remove the ":" at the end of each line
cat /www/allnodes.txt
echo "</pre>"
