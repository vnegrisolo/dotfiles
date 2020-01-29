#!make
.PHONY: help outdated update setup test start

help: # Shows this help.
	@grep ": \#" ${MAKEFILE_LIST} | column -t -s ':' | sort

outdated: # Shows outdated packages.
	yarn outdated
	npm outdated

update: # Update dependencies.
	yarn && yarn upgrade && yarn

setup: # Setup the app.
	yarn

test: # Run the test suite.
test: setup
	yarn lint
	yarn tsc
	yarn test

start: # Start the app.
	yarn start
