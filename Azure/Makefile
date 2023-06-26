version := 0.1.0
tf_version = 1.3.6

##
# INTERNAL VARIABLES
##
# Read all subsquent tasks as arguments of the first task
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(args) $(RUN_ARGS):;@:)

.PHONY: convert-to-json
convert-to-json: create-plan ## Check compliance against BDD rules https://terraform-compliance.com/pages/usage/
	@terraform show -json output.plan > output.plan.json


.PHONY: compliance
compliance: ## Check compliance against BDD rules https://terraform-compliance.com/pages/usage/
	@docker run --rm \
	-u $(id -u):$(id -g) \
	-v $(pwd):/target \
	--platform linux/amd64 \
	eerkunt/terraform-compliance \
	--planfile ./output.plan -f ./features/

.PHONY: test-compliance
test-compliance: create-plan compliance ## Macro command to create plan with output file and then test compliance 

.PHONY: get-state
get-state: ## Reformat your configuration in the standard style
	@docker run --rm -it \
	-u $(id -u):$(id -g) \
	-v ${PWD}:/data -w /data \
	-v ${HOME}/.config:/root/.config \
	--platform linux/amd64 \
	hashicorp/terraform:${tf_version} \
	state pull > state.out \
	&& docker run --rm -it \
	-v $(pwd):/target \
	--platform linux/amd64 \
	eerkunt/terraform-compliance \
	-p state.out -f ./features/ 

.PHONY: fmt
fmt: ## Reformat your configuration in the standard style
	@terraform fmt -recursive -diff $(args)

.PHONY: init
init: ## Prepare your working directory for other commands
	@terraform init

.PHONY: upgrade
upgrade: ## Install the latest module and provider versions allowed within configured constraints
	@terraform init -upgrade 

.PHONY: lint
lint: ## Lint the HCL code and display diffs of formatting changes
	@terraform fmt -diff=true -check $(args) $(RUN_ARGS)

.PHONY: validate
validate: ## Check whether the configuration is valid
	@terraform validate $(args) $(RUN_ARGS)

.PHONY: show
show: ## Show the current state or a saved plan
	@terraform show $(args) $(RUN_ARGS)

.PHONY: refresh
refresh: ## Update the state to match remote systems
	@terraform refresh $(args) $(RUN_ARGS)

.PHONY: plan
plan: dry-run ## Show changes required by the current configuration (alias for dry-run)

.PHONY: dry-run
dry-run: lint init validate ## Show changes required by the current configuration
	@terraform plan $(args) $(RUN_ARGS)

.PHONY: create-plan
create-plan: fmt init validate ## Generate changes required by the current configuration
	@terraform plan -out=output.plan

.PHONY: apply 
apply: run ## Create or update infrastructure (alias for run)

.PHONY: run
run: create-plan apply-plan ## Create or update infrastructure
		
.PHONY: apply-plan
apply-plan:
	@terraform apply output.plan $(args) $(RUN_ARGS)
	rm -rf output.plan

.PHONY: destroy
destroy: ## Destroy previously-created infrastructure
	@terraform apply -destroy -auto-approve $(args) $(RUN_ARGS)


.PHONY: docs
docs:  ## update terraform-docs
	@terraform-docs	-c .terraform-docs.yaml .

help:
	@printf "\033[32mTerraform-makefile v$(version)\033[0m\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
