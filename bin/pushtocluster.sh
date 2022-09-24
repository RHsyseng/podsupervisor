REGHOST=`oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}'`
podman login -u bogus -p $(oc whoami -t) ${REGHOST} --tls-verify=false
oc delete project podsupervisor
sleep 20
oc new-project podsupervisor
oc create -f is.yaml
BUILDNUMBER=`cat .currentbuild`
podman tag localhost/podsupervisor:latest $REGHOST/podsupervisor/podsupervisor:latest
podman tag localhost/podsupervisor:latest $REGHOST/podsupervisor/podsupervisor:$BUILDNUMBER
podman push $REGHOST/podsupervisor/podsupervisor:latest --tls-verify=false
podman push $REGHOST/podsupervisor/podsupervisor:$BUILDNUMBER --tls-verify=false
