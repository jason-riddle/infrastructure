apply:
	kubectl -v=3 apply --kustomize='.'

ui:
	kubectl port-forward service/argocd-server 8080:80 --namespace=argocd

username:
	echo admin

password:
	kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" --namespace=argocd | base64 -d
