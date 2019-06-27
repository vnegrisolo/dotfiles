#!make
.PHONY: help console docs deploy outdated setup test update-mix

HELP_START=": \#"
HELP_PADDING=11
help: # Shows this help.
	@grep ${HELP_START} $(MAKEFILE_LIST) | awk -F ${HELP_START} '{printf "\\033[33m%-${HELP_PADDING}s\\033[0m %s\\n", $$1, $$2}' | sort

console: # Opens the App console.
	iex -S mix

outdated: # Shows outdated packages.
	mix hex.outdated
	npm --prefix=assets/ outdated

setup: # Setup the App.
	mix deps.get
	mix deps.unlock --unused
	mix compile

test: # Run the test suite.
test: setup
	mix format
	MIX_ENV=test mix credo
	mix test --trace --cover
	MIX_ENV=test mix dialyzer

docs: # Generate documentation.
docs: setup
	echo "var versionNodes = [" > .doc-versions.js
	app=`mix run -e 'IO.puts(Mix.Project.config()[:app])'`; \
	for v in $$(git tag | tail -r); do echo "{version: \"$$v\", url: \"https://hexdocs.pm/$$app/$$v/\"}," >> .doc-versions.js; done
	echo "]" >> .doc-versions.js
	mix docs

deploy: # Deploy into hex.pm
deploy: test
	version=`mix run -e 'IO.puts(Mix.Project.config()[:version])'`; \
	git tag -a $${version} -m "Release $${version}"
	git push origin --tags
	echo "=> You'll have to input you local pass for hex"
	mix hex.user whoami
	mix hex.build
	mix hex.publish

update-mix: # Update mix packages.
	mix deps.update --all
