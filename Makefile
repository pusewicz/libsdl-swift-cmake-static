BUILD_DIR = build
LINK_STATIC ?= OFF

all: build

$(BUILD_DIR)/build.ninja:
	mkdir -p $(BUILD_DIR)
	cmake -B $(BUILD_DIR) -G Ninja \
		-DLINK_STATIC=$(LINK_STATIC)

build: $(BUILD_DIR)/build.ninja
	cmake --build $(BUILD_DIR)

run: build
	$(BUILD_DIR)/bin/StaticSDLSwift

clean:
	rm -rf $(BUILD_DIR)

rebuild: clean all

.PHONY: all build run clean rebuild
