.PHONY: comp sim wave run

TEST_NAME=fibonacci
BENCH=always_taken

comp:
	iverilog -g2012 -s $(BENCH)_tb -o always_taken_tb.vvp -c Filelist.f

sim:
	vvp always_taken_tb.vvp

wave:
	gtkwave always_taken_tb.vcd

hex:
	riscv32-unknown-elf-as -o ../02_test/test_assembly.o ../02_test/$(TEST_NAME).asm &&\
	riscv32-unknown-elf-objcopy -O verilog ../02_test/test_assembly.o ../02_test/dump/mem.dump &&\
	riscv32-unknown-elf-objdump -d ../02_test/test_assembly.o > ../02_test/output.asm &&\
    (cd ../02_test/dump && python3 imem_file_gen.py) &&\
	cp /home/datpham/CTMT/Milestone3/Always_taken/02_test/dump/mem_padded.dump /mnt/d/CTMT/MileStone3_AlwaysTaken/02_test/dump
run:
	make hex && make comp && make sim

test_hex:
	riscv32-unknown-elf-as -o ../02_test/test_assembly.o ../02_test/$(TEST_NAME).asm &&\
	riscv32-unknown-elf-objcopy -O verilog ../02_test/test_assembly.o ../02_test/dump/mem.dump &&\
	riscv32-unknown-elf-objdump -d ../02_test/test_assembly.o > ../02_test/output.asm
test:
	make comp && make sim