oc delete project podsupervisor
sleep 15
oc new-project podsupervisor
REGHOST=`oc get route default-route -n openshift-image-registry \
  --template='{{ .spec.host }}'`
podman login -u bogus -p $(oc whoami -t) ${REGHOST} 
./build.sh
podman tag localhost/podsupervisor:latest $REGHOST/podsupervisor/podsupervisor:latest
podman push $REGHOST/podsupervisor/podsupervisor:latest --tls-verify=false






