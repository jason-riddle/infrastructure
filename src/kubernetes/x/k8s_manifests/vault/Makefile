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

prune:
	kubectl apply --prune -f ./manifests/base/manifest.yml -l app=vault
