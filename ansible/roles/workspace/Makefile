default: help

help: ## Display this help screen
	@echo "Makefile available targets:"
	@grep -h -E '^[a-zA-Z_/%-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  * \033[36m%-32s\033[0m %s\n", $$1, $$2}'

test/syntax: ## Run lightweight syntax tests only
	yamllint .
	ansible-lint .
	ansible-playbook vagrant/test.yaml -i vagrant/inventory --syntax-check

test/molecule: ## Run molecule tests only
	molecule test

test: test/syntax test/molecule ## Run all linters and tests

# default is debian/buster64, specified in Vagrantfile
up: ## Up default vagrant environment
	cd vagrant && vagrant up

up/ubuntu: ## Up ubuntu/focal64 vagrant environment
	export BOX_IMAGE="ubuntu/focal64" && cd vagrant && vagrant up

provision: ## Provision role on vagrant environment
	printf '[defaults]\nroles_path=../' > ansible.cfg && \
	export ANSIBLE_CONFIG=ansible.cfg && \
	ansible --version && \
	ansible-playbook vagrant/test.yaml -i vagrant/inventory

destroy: ## Destroy vagrant environment
	cd vagrant && vagrant destroy -f

recreate: destroy up provision ## Destroy and create default vagrant environment, provision role

recreate/ubuntu: destroy up/ubuntu provision ## Destroy and create ubuntu/focal64 vagrant environment, provision role
