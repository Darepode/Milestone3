`timescale 1ns/1ps
module fwd_tb ();

    logic        i_clk;
    logic        i_rst_n;
    logic [31:0] i_io_sw;
    logic [3:0]  i_io_btn;

    logic [31:0] o_pc_debug;
    logic        o_insn_vld;
    logic [31:0] o_io_ledr;
    logic [31:0] o_io_ledg;
    logic [6:0]  o_io_hex0;
    logic [6:0]  o_io_hex1;
    logic [6:0]  o_io_hex2;
    logic [6:0]  o_io_hex3;
    logic [6:0]  o_io_hex4;
    logic [6:0]  o_io_hex5;
    logic [6:0]  o_io_hex6;
    logic [6:0]  o_io_hex7;
    logic [31:0] o_io_lcd;

    logic [31:0] reg0;
    logic [31:0] reg1;
    logic [31:0] reg2;
    logic [31:0] reg3;
    logic [31:0] reg4;
    logic [31:0] reg5;
    logic [31:0] reg6;
    logic [31:0] reg7;
    logic [31:0] reg8;
    logic [31:0] reg9;
    logic [31:0] reg10;
    logic [31:0] reg11;
    logic [31:0] reg12;
    logic [31:0] reg13;
    logic [31:0] reg14;
    logic [31:0] reg15;
    logic [31:0] reg16;
    logic [31:0] reg17;
    logic [31:0] reg18;
    logic [31:0] reg19;
    logic [31:0] reg20;
    logic [31:0] reg21;
    logic [31:0] reg22;
    logic [31:0] reg23;
    logic [31:0] reg24;
    logic [31:0] reg25;
    logic [31:0] reg26;
    logic [31:0] reg27;
    logic [31:0] reg28;
    logic [31:0] reg29;
    logic [31:0] reg30;
    logic [31:0] reg31;

    logic [6:0] type_instr;

    assign reg0  = fwd_inst.inst_regfile.register[0];
    assign reg1  = fwd_inst.inst_regfile.register[1];
    assign reg2  = fwd_inst.inst_regfile.register[2];
    assign reg3  = fwd_inst.inst_regfile.register[3];
    assign reg4  = fwd_inst.inst_regfile.register[4];
    assign reg5  = fwd_inst.inst_regfile.register[5];
    assign reg6  = fwd_inst.inst_regfile.register[6];
    assign reg7  = fwd_inst.inst_regfile.register[7];
    assign reg8  = fwd_inst.inst_regfile.register[8];
    assign reg9  = fwd_inst.inst_regfile.register[9];
    assign reg10 = fwd_inst.inst_regfile.register[10];
    assign reg11 = fwd_inst.inst_regfile.register[11];
    assign reg12 = fwd_inst.inst_regfile.register[12];
    assign reg13 = fwd_inst.inst_regfile.register[13];
    assign reg14 = fwd_inst.inst_regfile.register[14];
    assign reg15 = fwd_inst.inst_regfile.register[15];
    assign reg16 = fwd_inst.inst_regfile.register[16];
    assign reg17 = fwd_inst.inst_regfile.register[17];
    assign reg18 = fwd_inst.inst_regfile.register[18];
    assign reg19 = fwd_inst.inst_regfile.register[19];
    assign reg20 = fwd_inst.inst_regfile.register[20];
    assign reg21 = fwd_inst.inst_regfile.register[21];
    assign reg22 = fwd_inst.inst_regfile.register[22];
    assign reg23 = fwd_inst.inst_regfile.register[23];
    assign reg24 = fwd_inst.inst_regfile.register[24];
    assign reg25 = fwd_inst.inst_regfile.register[25];
    assign reg26 = fwd_inst.inst_regfile.register[26];
    assign reg27 = fwd_inst.inst_regfile.register[27];
    assign reg28 = fwd_inst.inst_regfile.register[28];
    assign reg29 = fwd_inst.inst_regfile.register[29];
    assign reg30 = fwd_inst.inst_regfile.register[30];
    assign reg31 = fwd_inst.inst_regfile.register[31];

    assign type_instr = fwd_inst.inst_ctrl_unit.instr[6:0]; 


fwd fwd_inst (
    .i_clk      (i_clk),
    .i_rstn     (i_rst_n),
    .i_io_sw    (i_io_sw),
    .i_io_btn   (i_io_btn),
    .o_pc_debug (o_pc_debug),
    .o_insn_vld (o_insn_vld),
    .o_io_ledr  (o_io_ledr),
    .o_io_ledg  (o_io_ledg),
    .o_io_hex0  (o_io_hex0),
    .o_io_hex1  (o_io_hex1),
    .o_io_hex2  (o_io_hex2),
    .o_io_hex3  (o_io_hex3),
    .o_io_hex4  (o_io_hex4),
    .o_io_hex5  (o_io_hex5),
    .o_io_hex6  (o_io_hex6),
    .o_io_hex7  (o_io_hex7),
    .o_io_lcd   (o_io_lcd)
);

    // Clock gen
    initial begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk;
    end

    // Reset gen
    initial begin
        i_rst_n = 0;
        #10 i_rst_n = 1;
    end

    integer nop_count;
    initial begin
        nop_count = 0;
        forever begin
        @(posedge i_clk);
        if(o_insn_vld == 0) nop_count++;
        end
    end

    // // Wave dump
    // initial begin
    //     $dumpfile("non_fwd_tb.vcd");
    //     $dumpvars(0,non_fwd_tb);
    //     #100000 begin
    //        $writememh("Mem_after.data", non_fwd_tb.non_fwd_inst.inst_lsu.data_mem);
    //        $writememh("Out_Mem_after.data", non_fwd_tb.non_fwd_inst.inst_lsu.output_mem);
    //        $writememh("In_Mem_after.data", non_fwd_tb.non_fwd_inst.inst_lsu.input_mem);
    //        $display("Number of NOP of the applications is %0d", nop_count);
    //        if(non_fwd_inst.IF_instr == 32'h0000006f) begin
    //        repeat(4) @(posedge i_clk);
    //        $finish(); 
    //        end
    //     end
    // end

    // initial begin
    //     #100
    //     $finish();
    // end 

    // Wave dump
    initial begin
        $dumpfile("fwd_tb.vcd");
        $dumpvars(0,fwd_tb);
        wait(fwd_inst.IF_instr == 32'h0000006f) begin
           $writememh("Mem_after.data", fwd_tb.fwd_inst.inst_lsu.data_mem);
           $writememh("Out_Mem_after.data", fwd_tb.fwd_inst.inst_lsu.output_mem);
           $writememh("In_Mem_after.data", fwd_tb.fwd_inst.inst_lsu.input_mem);
           $display("Number of NOP of the applications is %0d", nop_count);
           repeat(4) @(posedge i_clk);
           $finish(); 
           end
    end
    
    // Initilize memory
    // initial begin
    // // $display("BEGIN init mem");
    // // $readmemh("../02_test/mem.dump", singlecycle_tb.singlecycle_inst.imem_inst.instr_mem);
    // // $display("FINISH init mem");

    // #10; force singlecycle_tb.singlecycle_inst.i_io_btn = 4'b1000;
    // #500; force singlecycle_tb.singlecycle_inst.i_io_btn = 4'b0000;
    // // #20; release singlecycle_tb.singlecycle_inst.i_io_sw;
    // end

endmodule