.SUFFIXES:=
SHELL:=/bin/bash

# Paths to tools
JQ?=jq
PLCLI?=artifacts/plcli

PATTERN_DIR=$(CURDIR)/patterns

# Define rule to invoke parser
# Usage: hexpat <pattern> <test name>
define _hexpat
HEXPAT_TESTS+=$(MKPATH)$(2)

$(MKPATH)$(2).actual.json: $(MKPATH)$(2).bin | $(PLCLI)
	$(PLCLI) format --formatter=json $(MKPATH)$(2).bin $(PATTERN_DIR)/$(1).hexpat -o $(MKPATH)$(2).actual.json

$(MKPATH)$(2).json: $(MKPATH)$(2).actual.json
	$(JQ) -c < $(MKPATH)$(2).actual.json > $(MKPATH)$(2).json

endef
hexpat = $(eval $(call _hexpat,$(1),$(2)))

# Include all the make fragments

define _include-mk
MKPATH:=$(dir $(1))
include $(1)
MKPATH:=
endef

.PHONY: all
all: test

# Don't use "-L" if source code directory structure has symlink loops
$(foreach mk,$(shell find -L test_data -type f -name Local.mk),$(eval $(call _include-mk,$(mk))))

# Generate ".actual.json" files in test_data
.PHONY: parse
parse: $(addsuffix .actual.json,$(HEXPAT_TESTS))

# Copy ".actual.json" to ".json" files
.PHONY: sync
sync: $(addsuffix .json,$(HEXPAT_TESTS))

# Define target to check out plcli artifacts
artifacts/plcli: | artifacts
artifacts:
	git checkout origin/artifacts -- artifacts
	git rm -r --cached --quiet artifacts

# Remove all test artifacts
.PHONY: clean
clean:
	rm -rf artifacts
	find . -name '*.actual.json*' -delete

# Define unit tests
.PHONY: test
test: $(addsuffix .test,$(HEXPAT_TESTS))
%.test: %.json %.actual.json
	diff <( $(JQ) --sort-keys . $(word 1,$^) ) <( $(JQ) --sort-keys . $(word 2,$^) )
