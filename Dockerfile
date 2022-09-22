FROM registry.redhat.io/rhel-minimal
RUN microdnf install --enablerepo="rhocp-4.8-for-rhel-8-x86_64-rpms"  openshift-clients
COPY . .

