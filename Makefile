SHELL = /bin/bash
ENVDIR = $(HOME)/.python-env-workspace

all: help

help: ## Display this help screen
	@echo "Makefile available targets:"
	@grep -h -E '^[a-zA-Z_/%-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  * \033[36m%-32s\033[0m %s\n", $$1, $$2}'

init: ## Initialize python virtualenv and dependencies
	@test $$(which python3) || { echo "ERROR: python3 not found in PATH"; exit 1; }
	@test $$(which pip3) || { echo "ERROR: pip3 not found in PATH"; exit 1; }
	@test $$(which virtualenv) || { echo "ERROR: virtualenv not found in PATH"; exit 1; }
	virtualenv --quiet --clear-app-data $(ENVDIR)
	( source $(ENVDIR)/bin/activate; pip3 --quiet install -r requirements.txt )
	@echo "INFO: virtualenv:  $(ENVDIR)"
	@echo "INFO: activate:    source $(ENVDIR)/bin/activate"
	@echo "INFO: deactivate:  deactivate"

cleanup: ## Remove virtualenv
	rm -rf $(ENVDIR)