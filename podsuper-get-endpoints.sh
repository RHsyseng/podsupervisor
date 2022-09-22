mkdir -p data/endpoints
rm -r -f data/endpoints/*
oc get ep --all-namespaces -o  json > data/endpoints/endpoints.json

