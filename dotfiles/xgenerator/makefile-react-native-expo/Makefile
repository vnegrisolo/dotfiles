#!make
.PHONY: help console outdated setup test update

HELP_PADDING = 20

help: ## Shows this help.
	@IFS=$$'\\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
			IFS=$$'#' ; \
			help_split=($$help_line) ; \
			help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			printf "%-$(HELP_PADDING)s %s\\n" $$help_command $$help_info ; \
	done

console: ## Opens the App console.
	echo "console"

outdated: ## Shows outdated packages.
	npm outdated

setup: ## Setup the App.
	echo "setup"

test: ## Run the test suite.
test: setup
	echo "test"

update: ## Update mix packages.
	echo "update"
