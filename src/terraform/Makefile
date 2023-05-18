login:
	terraform login

init:
	terraform init

plan:
	terraform plan

fmt:
	terraform fmt -recursive

validate:
	terraform fmt -check -recursive -diff
	terraform validate .

kubeconfig:
	doctl kubernetes cluster kubeconfig save
