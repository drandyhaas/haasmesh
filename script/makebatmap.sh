
cat /www/dottop.html > /www/dotbat.html
/root/script/fixbattxt.sh >> /www/dotbat.html
cat /www/dotbottom.html >> /www/dotbat.html

echo "<a href=\"../../../../dotbat.html\">Click to view map</a>"

