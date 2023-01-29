BLACK   =$(shell echo "\033[00;30m")
RED     =$(shell echo "\033[00;31m")
GREEN   =$(shell echo "\033[00;32m")
YELLOW  =$(shell echo "\033[00;33m")
BLUE    =$(shell echo "\033[00;34m")
PURPLE  =$(shell echo "\033[00;35m")
CYAN    =$(shell echo "\033[00;36m")
WHITE   =$(shell echo "\033[00;37m")
RESTORE =$(shell echo "\033[0m")


.DEFAULT_GOAL := list

.PHONY: list
list:
	@echo "*********************"
	@echo "${YELLOW}Available targets${RESTORE}:"
	@echo "*********************"
	@grep -E '^[a-zA-Z-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-15s %s\n", $$1, $$2}'

stop:
	symfony server:stop

start:
	symfony server:start -d

webpack-build: ## build css and js
	yarn encore dev

webpack-install: ## install css and js
	yarn install

rm-cache: ## clear cache
	rm -rf var/cache/*
