oc delete cronjob.batch/openshiftpodsupervisor
sleep 10
oc set image-lookup podsupervisor
oc create -f podsupervisor.yaml
