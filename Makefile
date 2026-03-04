i386_asm_source_files := $(shell find src/impl/i386 -name "*.asm")
i386_asm_object_files := $(patsubst src/impl/i386/%.asm, build/i386/%.o, $(i386_asm_source_files))

build/i386/%.o: src/impl/i386/%.asm
	mkdir -p $(dir $@)
	nasm -f elf32 $< -o $@

.PHONY: build-i386
build-i386: $(i386_asm_object_files)
	mkdir -p dist/i386
	i686-elf-ld -n -o dist/i386/kernel.bin -T targets/i386/linker.ld $(i386_asm_object_files)
	cp dist/i386/kernel.bin targets/i386/iso/boot/kernel.bin
	grub-mkrescue /usr/lib/grub/i386-pc -o dist/i386/kernel.iso targets/i386/iso