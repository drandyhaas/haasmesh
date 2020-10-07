echo "Originator   last-seen  (#/255)   Nexthop     [outgoingIF] "
batctl o | sed s%.-192\.168\.%192\.168\.%g|sort -n|grep "*"|sed 's% \*     %%'

