.PHONY: all
## Runs the tests.
all:
	./gradlew test

.PHONY: start
## Starts the backend.
start:
	echo TODO

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
