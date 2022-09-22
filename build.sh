Echo "Using locally install openshift-client"
rpm -ql openshift-clients | tar cvf openshift-clients.tar -T -
podman build .
rm openshift-clients.tar

