SOURCE := micro_cpuid.s
OBJFILE := micro_cpuid.o
OUTPUT := micro_cpuid

.PHONY: all
all: make run

.PHONY: debug
debug: make_debug run_debug

.PHONY: make
make: as ld

.PHONY: make_debug
make_debug: as_debug ld

.PHONY: as
as:
	as --32 -o $(OBJFILE) $(SOURCE)

.PHONY: as_debug
as_debug:
	as -gstabs --32 -o $(OBJFILE) $(SOURCE)

.PHONY: ld
ld:
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o $(OUTPUT) $(OBJFILE) /lib32/libc.so.6

.PHONY: run
run:
	./$(OUTPUT)

.PHONY: run_debug
run_debug:
	gdb ./$(OUTPUT)

.PHONY: clean
clean:
	rm -f $(OUTPUT) $(OBJFILE)
