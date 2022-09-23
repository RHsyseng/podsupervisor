oc new-project podsupervisor
oc create -f is.yaml
REGHOST=`oc get route default-route -n openshift-image-registry \
  --template='{{ .spec.host }}'`
podman login -u bogus -p $(oc whoami -t) ${REGHOST} 
rpm -ql openshift-clients | tar cf openshift-clients.tar -T -
tar xf openshift-clients.tar
rm openshift-clients.tar
rm -r -f usr/share/man
mkdir .kube
cp ~/.kube/config .kube
oc new-app .
rm -r -f .kube/config





