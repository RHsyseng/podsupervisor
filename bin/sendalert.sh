ALERT_MANAGER=$(oc get route alertmanager-main -n openshift-monitoring -o jsonpath='{@.spec.host}')
curl --silent -o /dev/null -k -H "Authorization: Bearer $(oc sa get-token prometheus-k8s -n openshift-monitoring)"  -H 'Content-Type: application/json' -d '[{"labels": {"alertname": "$1","prometheus": "podsupervisor/nodewatcher","severity": "warning"},"annotations": {"message": "$2"},"status": {"state": "active","silencedBy": [],"inhibitedBy": []},"receivers": ["Default"]}]' https://$ALERT_MANAGER/api/v1/alerts 

