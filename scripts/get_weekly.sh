#!/bin/sh

for i in `jq '.[].url' weekly.json | sed 's/"//g'`
# for i in "http://bitcoinweekly.com/"
do
    name=`echo $i `
    id=`curl -s $i | hquery -p -r '$(".sample a").attr("href").split("/")[2]'`
    echo $id
done
