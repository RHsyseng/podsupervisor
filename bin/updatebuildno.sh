#!/bin/bash
IFS=,
while read NUM
do
echo $((NUM+1)) > .buildno.dat
done < .buildno.dat
cat .buildno.dat
