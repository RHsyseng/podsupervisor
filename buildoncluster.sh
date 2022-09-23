oc new-project podsupervisor
oc create -f is.yaml
REGHOST=`oc get route default-route -n openshift-image-registry \
  --template='{{ .spec.host }}'`
podman login -u bogus -p $(oc whoami -t) ${REGHOST} 





