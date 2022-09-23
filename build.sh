rpm -ql openshift-clients | tar cf openshift-clients.tar -T -
tar xf openshift-clients.tar
rm openshift-clients.tar
rm -r -f usr/share/man
mkdir .kube
cp ~/.kube/config .kube
podman build . --tag podsupervisor
rm -r -f .kube/config

