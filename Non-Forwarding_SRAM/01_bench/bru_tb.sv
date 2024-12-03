module bru_tb (
);

    logic  [31:0] rs1_data, rs2_data;
    logic  [0:0]  is_br, is_uncbr;
    logic  [2:0]  func3;
    logic  [0:0]  pc_sel;

    bru bru_inst(
        .rs1_data   (rs1_data),   // 32-bit input
        .rs2_data   (rs2_data),   // 32-bit input
        .is_br      (is_br),      // 1-bit input
        .is_uncbr   (is_uncbr),   // 1-bit input
        .func3      (func3),      // 3-bit input
        .pc_sel     (pc_sel)      // 1-bit input
    );

     // Task for direct testing
    task direct_test;
        input [31:0] rs1, rs2;
        input [0:0] br, uncbr;
        input [2:0] func;
        begin
            rs1_data = rs1;
            rs2_data = rs2;
            is_br = br;
            is_uncbr = uncbr;
            func3 = func;

            #10; // Wait for evaluation
            $display("Direct Test - rs1_data: %h, rs2_data: %h, is_br: %b, is_uncbr: %b, func3: %b, is_equal: %b, is_less: %b, is_less_uns: %b, pc_sel: %b",
                      rs1, rs2, br, uncbr, func, bru_inst.br_equal, bru_inst.br_less, bru_inst.br_less_uns, pc_sel);
        end
    endtask

    // Task for random testing
    task random_test;
        integer i;
        begin
            for (i = 0; i < 10; i = i + 1) begin
                rs1_data = $random;
                rs2_data = $random;
                is_br = $random % 2;
                is_uncbr = $random % 2;
                func3 = $random % 8;

                #10; // Wait for evaluation
                $display("Random Test %0d - rs1_data: %h, rs2_data: %h, is_br: %b, is_uncbr: %b, func3: %b, pc_sel: %b",
                          i, rs1_data, rs2_data, is_br, is_uncbr, func3, pc_sel);
            end
        end
    endtask

    

    // Initial block for test execution
    initial begin
        $display("Starting Comprehensive Direct Tests:");

    // Test 1: Unconditional Branch (is_uncbr)
    direct_test(32'h12345678, 32'h87654321, 1'b0, 1'b1, 3'b000); // Unconditional branch, pc_sel should be 1
    $display("\n");
    $display("\n");

    // Test 2: Conditional Branch - BEQ (func3 = 000)
    $display("Test 2: Conditional Branch - BEQ (func3 = 000)");
    direct_test(32'h00000001, 32'h00000001, 1'b1, 1'b0, 3'b000); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b1, 1'b0, 3'b000); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b1, 1'b0, 3'b000); // Unequal values, pc_sel should be 0

    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b0, 3'b000); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b0, 3'b000); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b0, 3'b000); // Unequal values, pc_sel should be 0

    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b1, 3'b000); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b1, 3'b000); // Unequal values, pc_sel should be 1
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b1, 3'b000); // Unequal values, pc_sel should be 1
    $display("\n");
    $display("\n");

    // Test 3: Conditional Branch - BNE (func3 = 001)
    $display("Test 3: Conditional Branch - BNE (func3 = 001)");
    direct_test(32'h00000001, 32'h00000001, 1'b1, 1'b0, 3'b001); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b1, 1'b0, 3'b001); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b1, 1'b0, 3'b001); // Unequal values, pc_sel should be 0

    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b0, 3'b001); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b0, 3'b001); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b0, 3'b001); // Unequal values, pc_sel should be 0

    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b1, 3'b001); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b1, 3'b001); // Unequal values, pc_sel should be 1
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b1, 3'b001); // Unequal values, pc_sel should be 1
    $display("\n");
    $display("\n");

    // Test 4: Conditional Branch - BLT (func3 = 100)
    $display("Test 4: Conditional Branch - BLT (func3 = 100)");
    direct_test(32'h00000001, 32'h00000001, 1'b1, 1'b0, 3'b100); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b1, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b1, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b1, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b1, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b1, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b1, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    $display("\n");
    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b0, 3'b100); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b0, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b0, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b0, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b0, 1'b0, 3'b100); // Unequal values, pc_sel should be 0
    $display("\n");
    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b1, 3'b100); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b1, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b1, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b0, 1'b1, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b0, 1'b1, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b0, 1'b1, 3'b100); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b0, 1'b1, 3'b100); // Unequal values, pc_sel should be 0
    $display("\n");
    $display("\n");

    // Test 5: Conditional Branch - BGE (func3 = 101)
    $display("Test 5: Conditional Branch - BGE (func3 = 101)");
    direct_test(32'h00000001, 32'h00000001, 1'b1, 1'b0, 3'b101); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b1, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b1, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b1, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b1, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b1, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b1, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    $display("\n");
    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b0, 3'b101); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b0, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b0, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b0, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b0, 1'b0, 3'b101); // Unequal values, pc_sel should be 0
    $display("\n");
    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b1, 3'b101); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b1, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b1, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b0, 1'b1, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b0, 1'b1, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b0, 1'b1, 3'b101); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b0, 1'b1, 3'b101); // Unequal values, pc_sel should be 0
    $display("\n");
    $display("\n");

    // Test 6: Conditional Branch - BLTU (func3 = 110)
    $display("Test 6: Conditional Branch - BLTU (func3 = 110)");
    direct_test(32'h00000001, 32'h00000001, 1'b1, 1'b0, 3'b110); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b1, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b1, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b1, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b1, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b1, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b1, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    $display("\n");
    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b0, 3'b110); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b0, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b0, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b0, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b0, 1'b0, 3'b110); // Unequal values, pc_sel should be 0
    $display("\n");
    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b1, 3'b110); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b1, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b1, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b0, 1'b1, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b0, 1'b1, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b0, 1'b1, 3'b110); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b0, 1'b1, 3'b110); // Unequal values, pc_sel should be 0
    $display("\n");
    $display("\n");

    // Test 7: Conditional Branch - BGEU (func3 = 111)
    $display("Test 7: Conditional Branch - BGEU (func3 = 111)");
    direct_test(32'h00000001, 32'h00000001, 1'b1, 1'b0, 3'b111); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b1, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b1, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b1, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b1, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b1, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b1, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    $display("\n");
    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b0, 3'b111); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b0, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b0, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b0, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b0, 1'b0, 3'b111); // Unequal values, pc_sel should be 0
    $display("\n");
    direct_test(32'h00000001, 32'h00000001, 1'b0, 1'b1, 3'b111); // Equal values, pc_sel should be 1
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b1, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'h00000002, 32'h00000001, 1'b0, 1'b1, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'h00000001, 32'hFFFFFFFF, 1'b0, 1'b1, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'h00000000, 1'b0, 1'b1, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFF0, 32'hFFFFFFFF, 1'b0, 1'b1, 3'b111); // Unequal values, pc_sel should be 0
    direct_test(32'hFFFFFFFF, 32'hFFFFFFF0, 1'b0, 1'b1, 3'b111); // Unequal values, pc_sel should be 0
    $display("\n");
    $display("\n");

    // Test 8: No branch taken
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b0, 3'b000); // No branch, pc_sel should be 0
    direct_test(32'h00000001, 32'h00000002, 1'b0, 1'b0, 3'b111); // No branch, pc_sel should be 0

    $display("Direct Tests Completed.");

        $finish;

        // // Call random tests
        // $display("\nStarting Random Tests:");
        // random_test;

        // $stop;
    end
    
endmodule