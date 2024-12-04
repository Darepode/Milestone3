module SRAM_model (
    input  logic        clk,               // System clock
    input  logic        reset_n,           // Active-low reset
    input  logic [17:0] i_sram_addr,       // Address input from controller
    input  logic        i_sram_we_n,       // Write Enable (active-low)
    input  logic        i_sram_ce_n,       // Chip Enable (active-low)
    input  logic        i_sram_lb_n,       // Lower Byte Enable (active-low)
    input  logic        i_sram_ub_n,       // Upper Byte Enable (active-low)
    inout  wire [15:0]  io_sram_dq,        // Bidirectional data bus
    input  logic        o_sram_oe_n        // Input Output Enable (active-low, controlled externally)
);

    // Internal SRAM memory
    reg [15:0] sram_memory [0:262143];  // 256 KB SRAM (18-bit address, 16-bit data)
    wire [15:0] data_out;                // Data output buffer for reads
   
    assign data_out = sram_memory[i_sram_addr];
    
    // Data bus tri-state logic
    assign io_sram_dq = ((!o_sram_oe_n) && (i_sram_we_n) && (!i_sram_ce_n) && (!i_sram_lb_n) && (!i_sram_ub_n)) ? data_out : 16'bz;

    always_ff @(posedge clk or negedge reset_n) begin
        if (((o_sram_oe_n) && (!i_sram_we_n) && (!i_sram_ce_n) && (!i_sram_lb_n) && (!i_sram_ub_n))) begin
            sram_memory[i_sram_addr] <= io_sram_dq;
        end
    end

endmodule
