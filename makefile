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
# OS detection
# ========================
ifeq ($(OS),Windows_NT)
    PLATFORM := Windows
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        PLATFORM := Linux
    else
        PLATFORM := Unknown
    endif
endif
ifeq ($(PLATFORM),Unknown)
$(error Unsupported platform)
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
MODE ?= make
ifeq ($(MODE),debug)
    BUILD_TYPE := DEBUG (_DEBUG)
    CFLAGS     := -Wall -Werror -Og -g -D_DEBUG
    CXXFLAGS   := -Wall -Werror -Og -g -D_DEBUG
endif
ifeq ($(MODE),normal)
    BUILD_TYPE := NORMAL
    CFLAGS     := -Wall -Werror -Og -g
    CXXFLAGS   := -Wall -Werror -Og -g
endif
ifeq ($(MODE),release)
    BUILD_TYPE := RELEASE
    CFLAGS     := -Wall -O2 -DNDEBUG
    CXXFLAGS   := -Wall -O2 -DNDEBUG
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
.PHONY: all build debug normal release run clean clean-output help info release-run nuke
# ========================
# Targets
# ========================
all: build
build: info $(TARGET)
debug:
	@$(MAKE) MODE=debug build
normal:
	@$(MAKE) MODE=normal build
release:
	@$(MAKE) MODE=release build
run: build
	@$(BLANK_CMD)
	@echo "Running $(TARGET)..."
	@$(RUN_CMD)
release-run: release
	@$(BLANK_CMD)
	@echo "Running release $(TARGET)..."
	@./$(TARGET)
info:
	@$(BLANK_CMD)
	@echo "============================"
	@echo "Building: $(BUILD_TYPE)"
	@echo "Platform: $(PLATFORM)"
	@echo "Object Dir: $(OBJ_DIR)"
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
	@echo "Cleaning build artifacts"
ifeq ($(PLATFORM),Windows)
	@if exist "obj\Windows" rmdir /s /q "obj\Windows"
	@if exist "obj" (dir /b "obj" | findstr . >nul || rmdir "obj")
	@if exist "$(TARGET_BASE).exe" del /q "$(TARGET_BASE).exe"
	@echo Done.
else # Linux
	@rm -rf "obj/Linux"
	@rmdir "obj" 2>/dev/null || true
	@rm -f "$(TARGET_BASE)"
	@echo Done.
endif
clean-output:
	@$(RMEXE_CMD)
	@echo "Output file removed."
nuke:
	@echo "NUKING all build artifacts (all OS outputs)"
ifeq ($(PLATFORM),Windows)
	@if exist "$(OBJ_BASE_DIR)" rmdir /s /q "$(OBJ_BASE_DIR)"
	@if exist "$(TARGET_BASE).exe" del /q "$(TARGET_BASE).exe"
	@if exist "$(TARGET_BASE)" del /q "$(TARGET_BASE)"
else
	@rm -rf "$(OBJ_BASE_DIR)"
	@rm -f "$(TARGET_BASE)"
	@rm -f "$(TARGET_BASE).exe"
endif
	@echo All build outputs removed.
help:
	@$(BLANK_CMD)
	@echo "Available targets:"
	@echo "  make debug		- -Og -g -D_DEBUG"
	@echo "  make normal         	- -Og -g"
	@echo "  make / make release 	- -O2 -DNDEBUG"
	@echo "  make run            	- build and run (Debug Mode)"
	@echo "  make release-run    	- build release and run"
	@echo "  make clean          	- remove objects + exe"
	@echo "  make nuke           	- remove objects + exe regardless of OS"
	@$(BLANK_CMD)
