
# Factorio makefile adapted from original by Nexela
# https://github.com/Nexela/PickerExtended/blob/master/makefile

# Get the current name and version from info.json
PACKAGE_NAME := $(shell jq -r .name info.json)
PACKAGE_VERSION := $(shell jq -r .version info.json)
PACKAGE_FULL_NAME := $(PACKAGE_NAME)_$(PACKAGE_VERSION)
PACKAGE_FILE := $(PACKAGE_FULL_NAME).zip
CONFIG_FILE = ./$(OUTPUT_DIR)/config.lua

# Set up build directoy and files
BUILD_DIR := build
OUTPUT_DIR := $(BUILD_DIR)/$(PACKAGE_FULL_NAME)

PKG_FILES := $(wildcard *.md) $(wildcard *.txt) $(wildcard locale) $(wildcard sound) $(wildcard LICENSE)
FILE_PATTERN := .*.(lua|json|png)$
SRC_FILES += $(shell find -E . -regex '$(FILE_PATTERN)' -type f -not -path './$(BUILD_DIR)/*')
SRC_FILES := $(SRC_FILES:%=$(OUTPUT_DIR)/%)

all: clean package zip

clean:
	@echo 'Removing build directory'
	@rm -rf $(BUILD_DIR)

package: $(SRC_FILES) nodebug
	@echo 'Copying files'
	@mkdir -p $(OUTPUT_DIR)
	@cp -r $(PKG_FILES) $(OUTPUT_DIR)

$(OUTPUT_DIR)/%.png: %.png
	@mkdir -p $(@D)
	@cp -r $< $(OUTPUT_DIR)/$<
# @pngquant --skip-if-larger --quiet --strip --ext .png --force $(OUTPUT_DIR)/$< || true

$(OUTPUT_DIR)/%.lua: %.lua
	@mkdir -p $(@D)
	@cp -r $< $(OUTPUT_DIR)/$<

$(OUTPUT_DIR)/%.json: %.json
	@mkdir -p $(@D)
	@cp -r $< $(OUTPUT_DIR)/$<

nodebug:
	@[ -e $(CONFIG_FILE) ] && \
	echo Removing debug switches from config.lua && \
	sed -i '' -e 's/^\(.*DECT.DEBUG.*=\).*/\1 false/' $(CONFIG_FILE) || \
	echo No config files

zip:
	@cd $(BUILD_DIR) && zip -rq $(PACKAGE_FILE) $(PACKAGE_FULL_NAME) && mkdir artifacts && cp -r $(PACKAGE_FILE) artifacts/$(PACKAGE_FILE)
	@echo $(PACKAGE_FULL_NAME) ready

release:
	git commit --all --allow-empty -m "Preparing Release v$(PACKAGE_VERSION)"
	git push
	git checkout master
	git merge --no-ff develop
	git tag -f v$(PACKAGE_VERSION)
	git push --tags
	git checkout develop
