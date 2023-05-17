.PHONY: base
base:
	kustomize build \
    	--enable-helm \
    	--helm-command helm \
    	./base

dev:
	kubectl -v=3 apply --kustomize='./dev'
