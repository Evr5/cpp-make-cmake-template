# Directories
BUILD_DIR := ./build
OUTPUT_DIR := .

# Detect OS
ifeq ($(OS),Windows_NT)
	CORES := $(NUMBER_OF_PROCESSORS)
	CLEAN_CMD := powershell -Command "if (Test-Path '$(BUILD_DIR)') { Remove-Item '$(BUILD_DIR)' -Recurse -Force }"
	GENERATOR := "Ninja"
else
	UNAME_S := $(shell uname -s)
	CORES := $(shell nproc)
	CLEAN_CMD := rm -rf $(BUILD_DIR)
	GENERATOR := "Unix Makefiles"
endif

# Targets
all: release

debug:
	@cmake -S . -B $(BUILD_DIR) -DCMAKE_BUILD_TYPE=Debug -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$(abspath $(OUTPUT_DIR))
	@cmake --build $(BUILD_DIR) -- -j$(CORES)

release:
	@cmake -S . -B $(BUILD_DIR) -DCMAKE_BUILD_TYPE=Release -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$(abspath $(OUTPUT_DIR))
	@cmake --build $(BUILD_DIR) -- -j$(CORES)

static:
	@cmake -S . -B build-static -DCMAKE_BUILD_TYPE=Release -DBUILD_STATIC=ON -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$(abspath $(OUTPUT_DIR))
	@cmake --build build-static -- -j$(CORES)

clean:
	@$(CLEAN_CMD)

re_debug: clean debug

re_release: clean release

.PHONY: all debug release clean re_debug re_release
