.PHONY: all
## Runs unit the tests.
all:test

.PHONY: test
## Runs the unit tests.
test:
	./gradlew test

-include ../.makehelp/include/makehelp/Help.mk

ifeq "help" "$(filter help,$(MAKECMDGOALS))"
../.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git ../.makehelp
endif

-include User.mk
-include ../User.mk
-include ~/User.mk
