apply:
	kubectl -v=3 apply --kustomize='.'

ui:
	kubectl port-forward service/argocd-server 8080:80 --namespace=argocd
