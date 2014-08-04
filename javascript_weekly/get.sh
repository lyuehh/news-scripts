#!/bin/sh

v=`cat ./version.txt`

for ((i=1;i<=$v;i++))
do
    if [ -d items/$i.csv ];
    then
        rm items/$i.csv
    fi
    echo "processing $i"
    curl -s "http://javascriptweekly.com/issues/$i" | hquery -p -f 'get.js' > items/$i.csv
done

