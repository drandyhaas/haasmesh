echo "To get to    Last-seen  Quality   Use node    On interface "
echo "Selected best routes:"
batctl o | sed s%.-192\.168\.%192\.168\.%g|sort -n|grep "*"|sed 's% \*     %%' | sed "s%\[%%g" | sed "s%\]%%g"
echo "Other possible routes:"
batctl o | sed s%.-192\.168\.%192\.168\.%g|sort -n|grep "192\.168\."|grep -v "*"|sed 's%       %%' | sed "s%\[%%g" | sed "s%\]%%g"

