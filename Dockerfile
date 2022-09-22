FROM registry.redhat.io/rhel-minimal
USER root
RUN mkdir -p /etc/pki/entitlement
RUN mkdir -p /etc/rhsm/ca
COPY etc/pki/entitlement /etc/pki/entitlement
COPY etc/rhsm/rhsm.conf /etc/rhsm/rhsm.conf
COPY etc/rhsm/ca/redhat-uep.pem /etc/rhsm/ca
RUN rm /etc/rhsm-host
RUN microdnf install --enablerepo="rhocp-4.8-for-rhel-8-x86_64-rpms" openshift-clients
COPY . .

