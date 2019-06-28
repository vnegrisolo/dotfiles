#!make
.PHONY: help outdated update setup test run-android run-ios link

help: # Shows this help.
	@grep ": \#" ${MAKEFILE_LIST} | column -t -s ':' | sort

outdated: # Shows outdated packages.
	yarn outdated
	npm outdated

update: # Update dependencies.
	yarn && yarn upgrade && yarn

setup: # Setup the App.
	yarn

test: # Run the test suite.
test: setup
	yarn lint
	yarn tsc
	yarn test

run-android: # Run Android App
	emulator -avd Nexus_5X_API_28_x86 &
	react-native run-android

run-ios: # Run iOS App
	react-native run-ios

link: # Run ReactNative links again
	react-native link @react-native-community/async-storage
	react-native link react-native-gesture-handler
