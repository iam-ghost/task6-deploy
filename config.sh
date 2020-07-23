docker start kubectl_portal
if docker exec kubectl_portal kubectl get pods | grep server
then
	docker exec kubectl_portal kubectl replace -f server.yaml
else
	docker exec kubectl_portal kubectl create -f server.yaml
	sleep 50
fi
POD=$(kubectl get pod -l app=httpd -o jsonpath="{.items[0].metadata.name}")
kubectl cp *.html $POD:/var/www/html/
