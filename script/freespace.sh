#free number of 1kB blocks
df |grep overlay|head -1| grep -E -o "[[:digit:]]+[[:space:]]+[[:digit:]]+%" | grep -E -o ".+\s"
