#!/bin/bash
rm /tmp/pods.data
oc get pod --all-namespaces -o wide --field-selector spec.nodeName=$1 | tail -n +2  >  /tmp/pods.data
input="/tmp/pods.data"
while IFS= read -r line
#Example data
#testapp                                            httpd-ex-1-build                                         0/1     Completed   0          19h     10.128.2.107    worker-1          <none>           <none>
#openshift-dns                                      dns-default-kzgfg                                        3/3     Running             0          6d7h    10.131.0.4      worker-0          <none>           <none>
do
    #echo "$line"
    namespace=`echo $line | cut -d' ' -f1`
    podname=`echo $line | cut -d' ' -f2`
    nodename=`echo $line | cut -d' ' -f8`
    ocpstr='openshift'
    if [[ "$namespace" == "openshift-dns" ]]; then
         if [[ "$nodename" == $1 ]]; then
            echo "Cleaning up  $nodename/$namespace/$podname"
            ./bin/sendalert.sh NODENOTREADY "PodSupervisor: Node: $nodename Application: $namespace Pod: $podnam - Deleted"
            oc delete po/$podname --namespace $namespace
           fi
        fi
    if [[ "$namespace" != *$ocpstr* ]]; then
         if [[ "$nodename" == $1 ]]; then
            echo "Cleaning up $nodename/$namespace/$podname"
            ./bin/sendalert.sh NODENOTREADY "PodSupervisor: Node: $nodename Application: $namespace Pod: $podnam - Deleted"
            oc delete po/$podname --namespace $namespace
           fi
       fi
done < "$input"

