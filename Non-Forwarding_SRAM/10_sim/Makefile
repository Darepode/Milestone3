.PHONY: comp sim wave run

TEST_NAME=test
BENCH=non_fwd

comp:
	iverilog -g2012 -s $(BENCH)_tb -o non_fwd_tb.vvp -c Filelist.f

sim:
	vvp non_fwd_tb.vvp

wave:
	gtkwave non_fwd_tb.vcd

hex:
	riscv32-unknown-elf-as -o ../02_test/test_assembly.o ../02_test/$(TEST_NAME).asm &&\
	riscv32-unknown-elf-objcopy -O verilog ../02_test/test_assembly.o ../02_test/dump/mem.dump &&\
	riscv32-unknown-elf-objdump -d ../02_test/test_assembly.o > ../02_test/output.asm &&\
    (cd ../02_test/dump && python3 imem_file_gen.py) &&\
	cp /home/datpham/CTMT/Milestone3/Non-Forwarding/02_test/dump/mem_padded.dump /mnt/d/CTMT/MileStone3_NonFwd/02_test
run:
	make hex && make comp && make sim

test:
	riscv32-unknown-elf-as -o ../02_test/test_assembly.o ../02_test/$(TEST_NAME).asm &&\
	riscv32-unknown-elf-objcopy -O verilog ../02_test/test_assembly.o ../02_test/dump/mem.dump &&\
	riscv32-unknown-elf-objdump -d ../02_test/test_assembly.o > ../02_test/output.asm &&\
	make comp && make sim