#!/bin/bash
oc get pod --all-namespaces -o wide | tail -n +2  >  data/pods.data
input="/root/data/pods.data"
while IFS= read -r line
#Example data
#testapp                                            httpd-ex-1-build                                         0/1     Completed   0          19h     10.128.2.107    worker-1          <none>           <none>
do
    #echo "$line"
    namespace=`echo $line | cut -d' ' -f1`
    podname=`echo $line | cut -d' ' -f2`
    nodename=`echo $line | cut -d' ' -f8`
    ocpstr='openshift'
    if [[ "$namespace" != *$ocpstr* ]]; then
         if [[ "$nodename" == $1 ]]; then
            echo "Cleaning up $nodename/$namespace/$podname"
            oc delete po/$podname
           fi
       fi
done < "$input"

