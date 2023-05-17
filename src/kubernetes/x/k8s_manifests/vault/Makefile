.PHONY: base
base:
	kustomize build \
    	--enable-helm \
    	--helm-command helm \
    	./kustomize/base > ./manifests/base.yml

.PHONY: dev
dev:
	kustomize build \
    	--enable-helm \
    	--helm-command helm \
    	./kustomize/dev > ./manifests/dev.yml
