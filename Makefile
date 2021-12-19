MAKEFILE_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: bootstrap
bootstrap:
	@$(MAKE) mint-bootstrap
	@$(MAKE) xcodegen-generate

.PHONY: open
open:
	open "$(MAKEFILE_DIR)ReSwiftApp.xcodeproj"

.PHONY: lint
lint:
	@if !(type "mint" > /dev/null 2>&1); then \
		echo "Mint not installed, see https://github.com/yonaskolb/Mint"; \
		exit 1; \
	fi
	mint run swiftlint --quiet

.PHONY: mint-bootstrap
mint-bootstrap:
	@if !(type "mint" > /dev/null 2>&1); then \
		echo "Mint not installed, see https://github.com/yonaskolb/Mint"; \
		exit 1; \
	fi
	mint bootstrap

.PHONY: xcodegen-generate
xcodegen-generate:
	@if !(type "mint" > /dev/null 2>&1); then \
		echo "Mint not installed, see https://github.com/yonaskolb/Mint"; \
		exit 1; \
	fi
	mint run xcodegen generate
