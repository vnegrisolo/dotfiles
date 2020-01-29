#!make
include .env

.PHONY: help console outdated setup setup-prod start start-prod test update-mix update-npm

help: # Shows this help.
	@grep ": \#" ${MAKEFILE_LIST} | column -t -s ':' | sort

.env:
	cp .env.example .env

console: # Opens the app console.
	iex -S mix

outdated: # Shows outdated packages.
	mix hex.outdated
	npm --prefix=assets/ outdated

setup: # Setup the app.
	mix deps.get
	mix deps.unlock --unused
	mix compile
	mix gettext.extract --merge --no-fuzzy
	mix ecto.setup
	cd assets/ && npm install && node node_modules/webpack/bin/webpack.js --mode development

setup-prod: # Setup the app for prod.
setup-prod: export MIX_ENV=prod
	mix deps.get
	mix deps.unlock --unused
	mix compile
	mix gettext.extract --merge --no-fuzzy
	mix ecto.setup
	rm -rf priv/static/ && cd assets/ && npm install && node node_modules/webpack/bin/webpack.js --mode production
	mix phx.digest

start: # Start the app.
start: setup
	(sleep 3 && open http://localhost:4000/) &
	mix phx.server

start-prod: # Start the app for prod.
start-prod: export MIX_ENV=prod
start-prod: export PORT=4001
start-prod: setup-prod
	(sleep 3 && open http://localhost:4001/) &
	mix phx.server

test: # Run the test suite.
test: setup
	mix format
	MIX_ENV=test mix credo
	rm -rf screenshots/*
	mix test
	npm --prefix=assets/ test
	MIX_ENV=test mix dialyzer

update-mix: # Update mix packages.
	mix deps.update --all

update-npm: # Update npm packages.
	cd assets/ && npm update && npm install
