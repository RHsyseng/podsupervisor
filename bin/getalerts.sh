ALERT_MANAGER=$(oc get route alertmanager-main -n openshift-monitoring -o jsonpath='{@.spec.host}')
curl -k -H "Authorization: Bearer $(oc sa get-token prometheus-k8s -n openshift-monitoring)"  https://$ALERT_MANAGER/api/v1/alerts

