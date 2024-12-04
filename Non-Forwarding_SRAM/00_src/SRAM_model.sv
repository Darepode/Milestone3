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
    reg [4:0]  cycle_counter;           // Counter for read/write delays
    reg [15:0] data_out;                // Data output buffer for reads
    reg        read_active;             // Indicates if a read operation is in progress
    reg        write_active;            // Indicates if a write operation is in progress

    // Data bus tri-state logic
    assign io_sram_dq = (!o_sram_oe_n && read_active && cycle_counter == 5) ? data_out : 16'bz;

    // Initial reset
    initial begin
        cycle_counter = 0;
        read_active = 0;
        write_active = 0;
    end

    // Read/Write FSM
    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            cycle_counter <= 0;
            read_active <= 0;
            write_active <= 0;
        end else begin
            // Read Operation
            if (!i_sram_ce_n && o_sram_oe_n == 0 && i_sram_we_n && !read_active && !write_active) begin
                read_active <= 1;
                cycle_counter <= 0;        // Start read delay
            end
            if (read_active) begin
                if (cycle_counter == 5) begin
                    data_out <= sram_memory[i_sram_addr];  // Output data after 5 cycles
                    read_active <= 0;        // Read complete
                end else begin
                    cycle_counter <= cycle_counter + 1;
                end
            end

            // Write Operation
            if (!i_sram_ce_n && i_sram_we_n == 0 && !read_active && !write_active) begin
                write_active <= 1;
                cycle_counter <= 0;        // Start write delay
            end
            if (write_active) begin
                if (cycle_counter == 1) begin
                    sram_memory[i_sram_addr] <= io_sram_dq;  // Capture data on the bus
                end
                if (cycle_counter == 2) begin
                    sram_memory[i_sram_addr] <= io_sram_dq;  // Capture data on the bus
                end
                if (cycle_counter == 2) begin
                    write_active <= 0;      // Write complete after 2 cycles
                end else begin
                    cycle_counter <= cycle_counter + 1;
                end
            end
        end
    end
endmodule
