# ========================
# Project configuration
# ========================
TARGET_BASE := main
CC  := gcc
CXX := g++
SRC_DIR := src
OBJ_BASE_DIR := obj

# Add your custom libraries here (e.g., -lglfw3 -lbox2d)
CUSTOM_LIBS :=

# ========================
# Language standard selection
# ========================
C_STD   ?= c11   # C standard (c89, c99, c11, c17, c2x)
CXX_STD ?= c++17 # C++ standard (c++98, c++11, c++14, c++17, c++20, c++23)

# ========================
# Configurable compiler flags (true/false)
# ========================
WALL      ?= true  # Enable all common warnings (-Wall)
WERROR    ?= true  # Treat warnings as errors (-Werror)
WEXTRA    ?= false # Enable extra warnings beyond -Wall (-Wextra)
WPEDANTIC ?= false # Enforce strict ISO C/C++ compliance (-Wpedantic)
WSHADOW   ?= false # Warn when a local variable shadows another variable (-Wshadow)

# Build the warning flags
WARNING_FLAGS :=
ifeq ($(WALL),true)
    WARNING_FLAGS += -Wall
endif
ifeq ($(WERROR),true)
    WARNING_FLAGS += -Werror
endif
ifeq ($(WEXTRA),true)
    WARNING_FLAGS += -Wextra
endif
ifeq ($(WPEDANTIC),true)
    WARNING_FLAGS += -Wpedantic
endif
ifeq ($(WSHADOW),true)
    WARNING_FLAGS += -Wshadow
endif

# Build the standard flags
STD_FLAGS := -std=$(C_STD)
CXX_STD_FLAGS := -std=$(CXX_STD)

# ========================
# OS detection
# ========================
ifeq ($(OS),Windows_NT)
    PLATFORM := Windows
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        PLATFORM := Linux
    else ifeq ($(UNAME_S),Darwin)
        PLATFORM := macOS
    else
        PLATFORM := Unknown
    endif
endif
ifeq ($(PLATFORM),Unknown)
$(error Unsupported platform: $(UNAME_S))
endif

# OS-specific object directory
OBJ_DIR := $(OBJ_BASE_DIR)/$(PLATFORM)

# ========================
# OS-specific shell commands
# ========================
ifeq ($(PLATFORM),Windows)
    TARGET := $(TARGET_BASE).exe
    MKDIR_CMD  = if not exist "$(OBJ_DIR)" mkdir "$(OBJ_DIR)"
    RMDIR_CMD  = if exist "$(OBJ_BASE_DIR)" rmdir /s /q "$(OBJ_BASE_DIR)"
    RMEXE_CMD  = if exist "$(TARGET)" del /q "$(TARGET)"
    RUN_CMD    = "$(CURDIR)/$(TARGET)"
    BLANK_CMD  = echo.
    PLATFORM_LIBS := -lopengl32 -lgdi32 -lwinmm
else  # Linux
    TARGET := $(TARGET_BASE)
    MKDIR_CMD  = mkdir -p "$(OBJ_DIR)"
    RMDIR_CMD  = rm -rf "$(OBJ_BASE_DIR)"
    RMEXE_CMD  = rm -f "$(TARGET)"
    RUN_CMD    = "$(CURDIR)/$(TARGET)"
    BLANK_CMD  = echo
    PLATFORM_LIBS := -lGL -lm -lpthread -ldl -lrt -lX11
endif

# ========================
# Include + lib paths
# ========================
INCLUDES := -I"$(CURDIR)/include"
COMMON_LDFLAGS := -L"$(CURDIR)/lib/$(PLATFORM)" -L"$(CURDIR)/lib" -lraylib $(CUSTOM_LIBS)
LDFLAGS := $(COMMON_LDFLAGS) $(PLATFORM_LIBS)

# ========================
# Build mode selection
# ========================
MODE ?= release
ifeq ($(MODE),debug)
    BUILD_TYPE := DEBUG (_DEBUG)
    CFLAGS     := $(WARNING_FLAGS) -Og -g -D_DEBUG
    CXXFLAGS   := $(WARNING_FLAGS) -Og -g -D_DEBUG
endif
ifeq ($(MODE),release)
    BUILD_TYPE := RELEASE
    CFLAGS     := $(WARNING_FLAGS) -O2 -DNDEBUG
    CXXFLAGS   := $(WARNING_FLAGS) -O2 -DNDEBUG
endif

# ========================
# Source discovery
# ========================
C_SOURCES   := $(wildcard $(SRC_DIR)/*.c)
CPP_SOURCES := $(wildcard $(SRC_DIR)/*.cpp)
C_OBJECTS   := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(C_SOURCES))
CPP_OBJECTS := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(CPP_SOURCES))
OBJECTS := $(C_OBJECTS) $(CPP_OBJECTS)

# Use C++ linker if any C++ files exist
ifeq ($(strip $(CPP_SOURCES)),)
    LINKER := $(CC)
else
    LINKER := $(CXX)
endif

.PHONY: all build debug release run clean clean-output help info debug-run purge

# ========================
# Targets
# ========================
all: build

build: info $(TARGET)

debug: clean
	@$(MAKE) MODE=debug build

release:
	@$(MAKE) MODE=release build

run: build
	@$(BLANK_CMD)
	@echo "Running $(TARGET)..."
	@$(RUN_CMD)

debug-run: debug
	@$(BLANK_CMD)
	@echo "Running debug $(TARGET)..."
	@$(RUN_CMD)

info:
	@$(BLANK_CMD)
	@echo "============================"
	@echo "Building: $(BUILD_TYPE)"
	@echo "Platform: $(PLATFORM)"
	@echo "Object Dir: $(OBJ_DIR)"
	@echo "Warning Flags: $(WARNING_FLAGS)"
	@echo "============================"

$(TARGET): $(OBJECTS)
	@$(BLANK_CMD)
	@echo "Linking..."
	$(LINKER) $(OBJECTS) $(LDFLAGS) -o "$(TARGET)"

# ========================
# Compile rules
# ========================
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@echo "Compiling C $< ..."
	$(CC) $(CFLAGS) $(INCLUDES) -c "$<" -o "$@"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	@echo "Compiling C++ $< ..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c "$<" -o "$@"

$(OBJ_DIR):
	@$(MKDIR_CMD)

# ========================
# Cleanup
# ========================
clean:
	@echo "Cleaning build artifacts for $(PLATFORM)..."
	@$(RMDIR_CMD)
	@$(RMEXE_CMD)
	@echo "Done."

clean-output:
	@echo "Removing output file..."
	@$(RMEXE_CMD)
	@echo "Output file removed."

purge:
	@echo "NUKING all build artifacts (all OS outputs)..."
ifeq ($(PLATFORM),Windows)
	@if exist "$(OBJ_BASE_DIR)" rmdir /s /q "$(OBJ_BASE_DIR)"
	@if exist "$(TARGET_BASE).exe" del /q "$(TARGET_BASE).exe"
	@if exist "$(TARGET_BASE)" del /q "$(TARGET_BASE)"
else
	@rm -rf "$(OBJ_BASE_DIR)"
	@rm -f "$(TARGET_BASE)"
	@rm -f "$(TARGET_BASE).exe"
endif
	@echo "All build outputs removed."

help:
	@$(BLANK_CMD)
	@echo "Available targets:"
	@echo "  make / make release  - Build in release mode (-O2 -DNDEBUG)"
	@echo "  make debug           - Build in debug mode (-Og -g -D_DEBUG)"
	@echo "  make run             - Build and run (release mode)"
	@echo "  make debug-run       - Build and run (debug mode)"
	@echo "  make clean           - Remove objects + exe for current platform"
	@echo "  make clean-output    - Remove only the executable"
	@echo "  make purge           - Remove all build artifacts (all platforms)"
	@echo "  make info            - Show build configuration"
	@$(BLANK_CMD)
	@echo "Configurable flags (set to true/false):"
	@echo "  WALL=$(WALL)         - Enable -Wall warnings"
	@echo "  WERROR=$(WERROR)     - Treat warnings as errors"
	@echo "  WEXTRA=$(WEXTRA)     - Enable -Wextra warnings"
	@echo "  WPEDANTIC=$(WPEDANTIC) - Enable -Wpedantic"
	@echo "  WSHADOW=$(WSHADOW)   - Enable -Wshadow"
	@$(BLANK_CMD)
	@echo "Example: make WERROR=false WEXTRA=true"
	@$(BLANK_CMD)