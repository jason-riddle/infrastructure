up:
	minikube config set cpus 2 &> /dev/null
	minikube config set memory 8192 &> /dev/null
	minikube config set driver virtualbox &> /dev/null
	minikube start

apply:
	make -C k8s_manifests/argocd apply
	make -C k8s_manifests/vault apply

delete:
	minikube delete
