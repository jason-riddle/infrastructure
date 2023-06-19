.PHONY: base
base:
	@mkdir -p ./manifests/base
	kustomize build \
		--enable-helm \
		--helm-command helm \
		./kustomize/base > ./manifests/base/manifest.yml

.PHONY: apply
apply: base
	kubectl apply -f ./manifests/base/manifest.yml

.PHONY: delete
delete:
	kubectl delete -f ./manifests/base/manifest.yml
