GIT_LAST_COMMIT := $(shell git describe --tags --always | sed 's/-/+/' | sed 's/^v//')
FLUTTER ?= flutter


VERSION ?= $(BRANCH)-$(GIT_LAST_COMMIT)


.PHONY: test
test:
	$(FLUTTER) test

.PHONY: build-all
build-all: build-release build-debug build-profile

.PHONY: build-release
build-release:
	$(FLUTTER) build apk --release --build-name=$(VERSION)

.PHONY: build-debug
build-debug:
	$(FLUTTER) build apk --debug --build-name=$(VERSION)

.PHONY: build-profile
build-profile:
	$(FLUTTER) build apk --profile --build-name=$(VERSION)