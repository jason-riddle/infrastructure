base:
	kustomize build --enable-helm ./manifests/kustomize/base > ./manifests/_base.yml

namespace:
	kubectl apply -f ./manifests/namespace.yml

apply: namespace
	kubectl apply -f ./manifests/_base.yml
