# Makefile for RISC-V Assembly Exercises

# Configuration
AS = riscv64-unknown-elf-as
LD = riscv64-unknown-elf-ld
SPIKE = spike
CODE_DIR = code  # Directory for source files
PROG ?= program   # Default program name, can be overridden
LINKER_SCRIPT = link.ld

# Default target
all: $(CODE_DIR)/$(PROG)

# Rule to assemble and link
$(CODE_DIR)/$(PROG): $(CODE_DIR)/$(PROG).s
	@mkdir -p $(CODE_DIR)
	cd $(CODE_DIR) && $(AS) -o $(PROG).o $(PROG).s
	cd $(CODE_DIR) && $(LD) -T $(LINKER_SCRIPT) -o $(PROG) $(PROG).o

# Rule to run with Spike
run: $(CODE_DIR)/$(PROG)
	cd $(CODE_DIR) && $(SPIKE) $(PROG)

# Rule to debug with Spike
debug: $(CODE_DIR)/$(PROG)
	cd $(CODE_DIR) && $(SPIKE) -d --log-commits $(PROG)

# Clean up
clean:
	rm -f $(CODE_DIR)/*.o $(CODE_DIR)/$(PROG)

.PHONY: all run debug clean