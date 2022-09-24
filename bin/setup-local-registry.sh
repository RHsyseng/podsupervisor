REGHOST=`oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}'`
oc patch configs.imageregistry.operator.openshift.io/cluster --patch '{"spec":{"defaultRoute":true}}' --type=merge
REGHOST=`oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}'`
podman login -u bogus -p $(oc whoami -t) ${REGHOST} --tls-verify=false

