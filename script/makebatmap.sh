
cat /www/dottop.html > /www/dotbat.html

/root/script/bathosts.sh >> /www/dotbat.html

# make it friendly for javascript
# add a \ and maybe || at the end of each line
# add the surrounding var text

# batvis
echo -n "var txt = '" >> /www/dotbat.html
batadv-vis -f jsondoc | sed -e 's%$%\ \\%' >> /www/dotbat.html
echo "'" >> /www/dotbat.html 

# the wifi strengths
echo -n "var txt2 = '" >> /www/dotbat.html
echo -n `alfred -r 67` >> /www/dotbat.html
echo "'" >> /www/dotbat.html

# the bat-hosts
echo -n "var txt3 = '" >> /www/dotbat.html
cat /etc/bat-hosts | sed -e 's%$%\ ||\\%' >> /www/dotbat.html
echo "'" >> /www/dotbat.html

# the dhcp leases
echo -n "var txt4 = '" >> /www/dotbat.html
cat /tmp/dhcp.leases | sed -e 's%$%\ ||\\%' >> /www/dotbat.html
echo "'" >> /www/dotbat.html

cat /www/dotbottom.html >> /www/dotbat.html

echo "<a href=\"../../../../dotbat.html\">Click to view map</a>"

