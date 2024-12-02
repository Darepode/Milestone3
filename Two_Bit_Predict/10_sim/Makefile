.PHONY: comp sim wave run

TEST_NAME=application
BENCH=two_bit

comp:
	iverilog -g2012 -s $(BENCH)_tb -o two_bit_tb.vvp -c Filelist.f

sim:
	vvp two_bit_tb.vvp

wave:
	gtkwave two_bit_tb.vcd

hex:
	riscv32-unknown-elf-as -o ../02_test/test_assembly.o ../02_test/$(TEST_NAME).asm &&\
	riscv32-unknown-elf-objcopy -O verilog ../02_test/test_assembly.o ../02_test/dump/mem.dump &&\
	riscv32-unknown-elf-objdump -d ../02_test/test_assembly.o > ../02_test/output.asm &&\
    (cd ../02_test/dump && python3 imem_file_gen.py) &&\
	cp /home/datpham/CTMT/Milestone3/Two_Bit_Predict/02_test/dump/mem_padded.dump /mnt/d/CTMT/MileStone3_TwoBit/02_test/dump
run:
	make hex && make comp && make sim

test:
	riscv32-unknown-elf-as -o ../02_test/test_assembly.o ../02_test/$(TEST_NAME).asm &&\
	riscv32-unknown-elf-objcopy -O verilog ../02_test/test_assembly.o ../02_test/dump/mem.dump &&\
	riscv32-unknown-elf-objdump -d ../02_test/test_assembly.o > ../02_test/output.asm &&\
	make comp && make sim