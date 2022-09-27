BUILDNUMBER=`./bin/updatebuildno.sh`
echo $BUILDNUMBER
./bin/clone_package.sh openshift-clients
rm -r -f usr/share/man
mkdir -p .kube
cp ~/.kube/config .kube
podman build . --tag podsupervisor:$BUILDNUMBER
podman build . --tag podsupervisor:latest
echo $BUILDNUMBER > .currentbuild
rm -r -f .kube/config

