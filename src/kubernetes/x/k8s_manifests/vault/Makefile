.PHONY: base
base:
	@mkdir -p ./manifests/base
	kustomize build \
		--enable-helm \
		--helm-command helm \
		./kustomize/base > ./manifests/base/manifest.yml

.PHONY: dev
dev:
	@mkdir -p ./manifests/dev
	kustomize build \
		--enable-helm \
		--helm-command helm \
		./kustomize/dev > ./manifests/dev/manifest.yml
