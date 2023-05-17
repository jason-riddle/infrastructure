build:
	kustomize build \
    	--enable-helm \
    	--helm-command helm \
    	./base

apply:
	kubectl -v=3 apply --kustomize='./base'
