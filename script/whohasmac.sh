alfred -r 66 | grep -i $1 | cut -d " " -f 3 | sed s%\"%%
