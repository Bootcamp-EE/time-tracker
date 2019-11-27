.PHONY: all
## Runs MongoDb via Docker.
all:
	docker-compose up

-include ../.makehelp/include/makehelp/Help.mk

ifeq "help" "$(filter help,$(MAKECMDGOALS))"
../.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git ../.makehelp
endif

-include User.mk
-include ../User.mk
-include ~/User.mk
