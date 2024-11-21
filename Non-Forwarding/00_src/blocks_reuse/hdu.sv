module hdu (
    input logic pcsel_exmem, is_br_exmem, is_uncbr_exmem, 
                rdwren_idex, rdwren_exmem,      
    input logic [4:0] rd_idex, rd_exmem, rs1_ifid, rs2_ifid,

    output logic clear_ifid, clear_idex,
                 clear_exmem, wren_ifid, pc_wren  
);
    always @(*) begin
        if(pcsel_exmem && (is_br_exmem || is_uncbr_exmem)) begin
            clear_ifid  = 1'b1;
            clear_idex  = 1'b1;
            clear_exmem = 1'b1;
        end else if((rdwren_idex && (rd_idex == rs1_ifid || rd_idex == rs2_ifid)) || 
                    (rdwren_exmem && (rd_exmem == rs1_ifid || rd_exmem == rs2_ifid))) begin
                        pc_wren    = 1'b0;
                        wren_ifid  = 1'b0;
                        clear_idex = 1'b1;
        end else begin
            clear_ifid  = 1'b0;
            clear_idex  = 1'b0;
            clear_exmem = 1'b0;
            pc_wren     = 1'b1;
            wren_ifid   = 1'b1;           
        end
    end

endmodule
