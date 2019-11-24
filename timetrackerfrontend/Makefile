.PHONY: all
## Runs the unit tests on your machine.
all: test

.PHONY: install
## Runs the unit tests on your machine.
install:
	npm install

.PHONY: test
## Runs the unit tests on your machine.
test:install
	CI=true npm test

.PHONY: start
## Starts the React application.
start:install
	npm start

.PHONY: dist-clean
## Removes all generated and downloaded files.
dist-clean::
	$(RM) -r node_modules/

-include ../.makehelp/include/makehelp/Help.mk

ifeq "help" "$(filter help,$(MAKECMDGOALS))"
../.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git ../.makehelp
endif

-include User.mkk
-include ../User.mkk
-include ~/User.mk
