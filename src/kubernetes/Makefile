K8S_CLUSTER := jasons-k8s-cluster
K8S_REGION  := sfo3
K8S_VERSION := 1.26.3-do.0

K8S_POOL_NAME  := worker-pool
K8S_POOL_SIZE  := s-1vcpu-2gb
K8S_POOL_COUNT := 1

cluster:
	doctl kubernetes cluster create $(K8S_CLUSTER) \
		--region $(K8S_REGION) \
		--version $(K8S_VERSION) \
		--node-pool "name=$(K8S_POOL_NAME);size=$(K8S_POOL_SIZE);count=$(K8S_POOL_COUNT)"

kubeconfig:
	doctl kubernetes cluster kubeconfig save $(K8S_CLUSTER)

dash:
	open https://cloud.digitalocean.com/kubernetes/clusters/22455c81-c216-4187-9dc9-4450bbc51260/db/e83cb6be-f2b9-4b4c-9aff-f3289c7ca9ff/#/overview?namespace=_all
