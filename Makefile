CC ?= gcc
CFLAGS = -O3 -MMD -std=c99
LIBS = -lm
EXE = twdgrow

MKDIR = /bin/mkdir -p
RM = /bin/rm -f

BUILD_DIR = ./build
OBJECTS_DIR = $(BUILD_DIR)/objects
BIN_DIR = $(BUILD_DIR)/bin
BIN_EXE = $(BIN_DIR)/$(EXE)

SRCS = $(wildcard src/*.c)
OBJS = $(SRCS:%.c=$(OBJECTS_DIR)/%.o)
DEPS = $(OBJS:%.o=%.d)

all: FLAGS = $(CFLAGS)
all: $(BIN_EXE)

$(BIN_EXE): $(OBJS)
	$(MKDIR) $(@D)
	$(CC) $(FLAGS) -o $@ $< $(LIBS)

-include $(DEPS)

$(OBJECTS_DIR)/%.o: %.c
	$(MKDIR) $(@D)
	$(CC) $(FLAGS) -c $< -o $@

.PHONY : clean
clean:
	$(RM) -r $(BUILD_DIR)
