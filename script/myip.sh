ifconfig | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}' | head -1
