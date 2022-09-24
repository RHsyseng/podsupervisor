#!/bin/bash
pwd
whoami
echo $HOME
for i in {1..12}; do
  oc get nodes |  tail -n +2  >  /tmp/nodes.data
  input="/tmp/nodes.data"
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
  sleep 5
done



