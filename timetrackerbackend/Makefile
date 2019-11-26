.PHONY: all
## Runs unit the tests.
all:test

.PHONY: test
## Runs the unit tests.
test:
	./gradlew test

.PHONY: start
## Starts the backend.
start:
	./gradlew bootRun

.PHONY: clean
## Removes generated files.
clean::
	./gradlew clean

-include ../.makehelp/include/makehelp/Help.mk

ifeq "help" "$(filter help,$(MAKECMDGOALS))"
../.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git ../.makehelp
endif

-include User.mkk
-include ../User.mkk
-include ~/User.mk
