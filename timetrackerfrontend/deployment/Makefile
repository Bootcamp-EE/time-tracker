.PHONY: all
## Runs the unit tests on your machine.
all: build

.PHONY: install
## Runs the unit tests on your machine.
install:
	npm install

.PHONY: build
## Build the React application.
build:install
build:
	npm run-script build

.PHONY: dist-clean
## Removes all generated and downloaded files.
dist-clean::
	$(RM) -r node_modules/

-include ../.makehelp/include/makehelp/Help.mk

ifeq "help" "$(filter help,$(MAKECMDGOALS))"
../.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git ../.makehelp
endif

-include User.mk
-include ../User.mk
-include ~/User.mk
