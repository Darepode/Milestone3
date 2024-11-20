module shifter_tb();
    logic [31:0] i_operand_a;
    logic [4:0]  i_operand_b;
    logic [31:0] o_sll_data, o_sra_data, o_srl_data;

    sll sll_inst(
        .i_operand_a (i_operand_a),
        .i_operand_b (i_operand_b),
        .o_sll_data (o_sll_data)
    );

    srl srl_inst(
        .i_operand_a (i_operand_a),
        .i_operand_b (i_operand_b),
        .o_srl_data (o_srl_data)
    );

    sra sra_inst(
        .i_operand_a (i_operand_a),
        .i_operand_b (i_operand_b),
        .o_sra_data (o_sra_data)
    );

        // Wave dump
    initial begin
        #10
        direct_test(32'h0F0F0F0F, 4'd0);
        direct_test(32'h0F0F0F0F, 4'd1);
        direct_test(32'h0F0F0F0F, 4'd2);
        direct_test(32'h0F0F0F0F, 4'd3);
        direct_test(32'h0F0F0F0F, 4'd4);
        direct_test(32'h0F0F0F0F, 4'd5);
        direct_test(32'h0F0F0F0F, 4'd6);
        direct_test(32'h0F0F0F0F, 4'd7);
        direct_test(32'h0F0F0F0F, 4'd8);
        direct_test(32'h0F0F0F0F, 4'd9);
        direct_test(32'h0F0F0F0F, 4'd10);
        direct_test(32'h0F0F0F0F, 4'd11);
        direct_test(32'h0F0F0F0F, 4'd12);
        direct_test(32'h0F0F0F0F, 4'd13);
        direct_test(32'h0F0F0F0F, 4'd14);
        direct_test(32'h0F0F0F0F, 4'd15);
        direct_test(32'h0F0F0F0F, 4'd16);
        direct_test(32'h0F0F0F0F, 4'd17);
        direct_test(32'h0F0F0F0F, 4'd18);
        direct_test(32'h0F0F0F0F, 4'd19);
        direct_test(32'h0F0F0F0F, 4'd20);
        direct_test(32'h0F0F0F0F, 4'd21);
        direct_test(32'h0F0F0F0F, 4'd22);
        direct_test(32'h0F0F0F0F, 4'd23);
        direct_test(32'h0F0F0F0F, 4'd24);
        direct_test(32'h0F0F0F0F, 4'd25);
        direct_test(32'h0F0F0F0F, 4'd26);
        direct_test(32'h0F0F0F0F, 4'd27);
        direct_test(32'h0F0F0F0F, 4'd28);
        direct_test(32'h0F0F0F0F, 4'd29);
        direct_test(32'h0F0F0F0F, 4'd30);
        direct_test(32'h0F0F0F0F, 4'd31);

        direct_test(32'hF0F0F0F0, 4'd0);
        direct_test(32'hF0F0F0F0, 4'd1);
        direct_test(32'hF0F0F0F0, 4'd2);
        direct_test(32'hF0F0F0F0, 4'd3);
        direct_test(32'hF0F0F0F0, 4'd4);
        direct_test(32'hF0F0F0F0, 4'd5);
        direct_test(32'hF0F0F0F0, 4'd6);
        direct_test(32'hF0F0F0F0, 4'd7);
        direct_test(32'hF0F0F0F0, 4'd8);
        direct_test(32'hF0F0F0F0, 4'd9);
        direct_test(32'hF0F0F0F0, 4'd10);
        direct_test(32'hF0F0F0F0, 4'd11);
        direct_test(32'hF0F0F0F0, 4'd12);
        direct_test(32'hF0F0F0F0, 4'd13);
        direct_test(32'hF0F0F0F0, 4'd14);
        direct_test(32'hF0F0F0F0, 4'd15);
        direct_test(32'hF0F0F0F0, 4'd16);
        direct_test(32'hF0F0F0F0, 4'd17);
        direct_test(32'hF0F0F0F0, 4'd18);
        direct_test(32'hF0F0F0F0, 4'd19);
        direct_test(32'hF0F0F0F0, 4'd20);
        direct_test(32'hF0F0F0F0, 4'd21);
        direct_test(32'hF0F0F0F0, 4'd22);
        direct_test(32'hF0F0F0F0, 4'd23);
        direct_test(32'hF0F0F0F0, 4'd24);
        direct_test(32'hF0F0F0F0, 4'd25);
        direct_test(32'hF0F0F0F0, 4'd26);
        direct_test(32'hF0F0F0F0, 4'd27);
        direct_test(32'hF0F0F0F0, 4'd28);
        direct_test(32'hF0F0F0F0, 4'd29);
        direct_test(32'hF0F0F0F0, 4'd30);
        direct_test(32'hF0F0F0F0, 4'd31);

        $dumpfile("singlecycle_tb.vcd");
        $dumpvars(0,shifter_tb);
        #1000 begin
           $finish(); 
        end 
    end


    task direct_test (input bit [31:0] opa, input bit [4:0] opb);
        i_operand_a = opa;
        i_operand_b = opb;
        #10
        if(o_sll_data != (opa << opb)) $display("Error in SLL at %0d\n", opb); 
        else $display("SLL successfully %32b %0d\n", o_sll_data, opb);
        if(o_srl_data != (opa >> opb)) $display("Error in SRL at %0d\n", opb);
        else $display("SRL successfully %32b %0d\n", o_srl_data, opb);
        if($signed(o_sra_data) != ($signed(opa) >>> opb)) $display("Error in SRA at %0d\n", opb);
        else $display("SRA successfully %32b %0d\n", o_sra_data, opb);
    endtask


endmodule