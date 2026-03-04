# 1. On sépare les sources
asm_sources := $(shell find src/impl/i386 -name "*.asm")
c_sources := $(shell find src/impl/i386/ -name "*.c")

# 2. On crée la liste de tous les objets attendus
asm_objects := $(patsubst src/impl/i386/%.asm, build/i386/%.o, $(asm_sources))
c_objects := $(patsubst src/impl/i386/%.c, build/i386/%.o, $(c_sources))

all_objects := $(asm_objects) $(c_objects)

# Règle pour l'assembleur
build/i386/%.o: src/impl/i386/%.asm
	mkdir -p $(dir $@)
	nasm -f elf32 $< -o $@

# Règle pour le C
build/i386/%.o: src/impl/i386/%.c
	mkdir -p $(dir $@)
	i686-elf-gcc -c $< -o $@ -std=c11 -ffreestanding -O2 -Wall -Wextra

.PHONY: build-i386
build-i386: $(all_objects)
	mkdir -p dist/i386
	i686-elf-ld -n -o dist/i386/kernel.bin -T targets/i386/linker.ld $(all_objects)
	# Préparation de l'ISO
	cp dist/i386/kernel.bin targets/i386/iso/boot/kernel.bin
	grub-mkrescue /usr/lib/grub/i386-pc -o dist/i386/kernel.iso targets/i386/iso