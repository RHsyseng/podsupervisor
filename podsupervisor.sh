#!/bin/bash
pwd
oc get nodes |  tail -n +2  >  /root/data/nodes.data
input="/root/data/nodes.data"
while IFS= read -r line
#Example data
#control-plane-0   Ready    master   27h   v1.20.10+bbbc079

do
    #echo "$line"
    nodename=`echo $line | cut -d' ' -f1`
    nodestate=`echo $line | cut -d' ' -f2`
    readystr='Ready'
    if [[ "$nodestate" != "$readystr" ]]; then
            echo "Cleaning up $nodename"
            ./podsuper-nodecleanup.sh $nodename
       fi
done < "$input"



