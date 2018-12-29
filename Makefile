# Compilation
# compiler (if defined use 'cc' else use clang)
CC ?= gcc

# compilation flags
CFLAGS = -pedantic# warn on language extensions
CFLAGS += -std=c11# C11 standard mode
CFLAGS += -Werror# turn warnings into errors.
CFLAGS += -Wall#turn on all warnings
CFLAGS += -Wextra# turn on extra warnings
# utilities flags
CFLAGS += -MMD# write dependency file
# libraries flags
LIBS = -lm
# optimization flags
OPT_FLAGS = -O2# optimization level
OPT_FLAGS += -ffast-math# fast math mode
# coverage flags
COV_FLAGS = -coverage
COV_FLAGS += -O0

#Utilities
MKDIR = /bin/mkdir -p
RM = /bin/rm -f

# Project structure
EXE = twdgrow# executable name
BUILD_DIR = ./build# build directory
OBJECTS_DIR = $(BUILD_DIR)/objects# objects directory
BIN_DIR = $(BUILD_DIR)/bin# bin directory
BIN_EXE = $(BIN_DIR)/$(EXE)# executable path

# Files
MAIN = src/main.c
SRCS = $(filter-out $(MAIN), $(wildcard src/*.c))
OBJS = $(SRCS:%.c=$(OBJECTS_DIR)/%.o)
DEPS = $(OBJS:%.o=%.d)

#Tests
TEST = twdgrow-test# test executable name
TEST_DIR = $(BUILD_DIR)/test# test direcotory
TEST_EXE = $(TEST_DIR)/$(TEST)# test executable path

#Test files
TESTS = $(wildcard test/*.c)

#Rules
all: CFLAGS += $(OPT_FLAGS)
all: $(BIN_EXE)

test: CFLAGS += $(COV_FLAGS)
test: $(TEST_EXE)

$(BIN_EXE): $(OBJS) $(MAIN)
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

$(TEST_EXE): $(SRCS) $(TESTS)
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

-include $(DEPS)

$(OBJECTS_DIR)/%.o: %.c
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY : clean
clean:
	$(RM) -r $(BUILD_DIR)
