#!make
include .env

.PHONY: help console outdated setup setup-prod server server-prod test update-mix update-npm

HELP_PADDING = 20

.env:
	cp .env.example .env

help: ## Shows this help.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
			IFS=$$'#' ; \
			help_split=($$help_line) ; \
			help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			printf "%-$(HELP_PADDING)s %s\n" $$help_command $$help_info ; \
	done

console: ## Opens the App console.
	iex -S mix

outdated: ## Shows outdated packages.
	mix hex.outdated
	npm --prefix=assets/ outdated

setup: ## Setup the App.
	mix deps.get
	mix compile
	mix gettext.extract --merge --no-fuzzy
	mix ecto.setup
	cd assets/ && npm install && node node_modules/webpack/bin/webpack.js --mode development

setup-prod: export MIX_ENV=prod
setup-prod: ## Setup the App for prod.
	mix deps.get
	mix compile
	mix gettext.extract --merge --no-fuzzy
	mix ecto.setup
	rm -rf priv/static/ && cd assets/ && npm install && node node_modules/webpack/bin/webpack.js --mode production
	mix phx.digest

server: setup
server: ## Start the App server.
	(sleep 3 && open http://localhost:4000/) &
	mix phx.server

server-prod: export MIX_ENV=prod
server-prod: export PORT=4001
server-prod: setup-prod
server-prod: ## Start the App server for prod.
	(sleep 3 && open http://localhost:4001/) &
	mix phx.server

test: ## Run the test suite.
test: setup
	mix format
	MIX_ENV=test mix credo
	rm -rf screenshots/*
	mix test --trace --cover
	npm --prefix=assets/ test
	MIX_ENV=test mix dialyzer

update-mix: ## Update mix packages.
	mix deps.update --all

update-npm: ## Update npm packages.
	cd assets/ && npm update && npm install
