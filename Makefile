final.bin: compromyseos.asm
	nasm -Wall -f bin -o compromyseos.bin compromyseos.asm
	dd bs=512 if=compromyseos.bin of=final.bin

run: final.bin
	$(eval num_kb := $(shell du -k final.bin | cut -f1))
	@echo "Binary is $(num_kb) KB long"
	qemu-system-x86_64 -serial stdio -d guest_errors -drive format=raw,file=final.bin

clean:
	rm -rf compromyseos.bin  final.bin