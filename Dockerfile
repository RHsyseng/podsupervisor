FROM registry.redhat.io/rhel-minimal
COPY etc /etc
COPY usr /usr
WORKDIR /app
COPY . /app
RUN mkdir /.kube
COPY .kube/config /.kube

