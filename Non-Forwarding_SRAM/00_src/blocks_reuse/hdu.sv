module hdu (
    input logic EXMEM_pcsel, EXMEM_is_br, EXMEM_is_uncbr, sram_stall,
                IDEX_rdwren, EXMEM_rdwren,      
    input logic [4:0] IDEX_rd, EXMEM_rd, IFID_rs1, IFID_rs2,

    output logic IFID_clear, IDEX_clear,
                 EXMEM_clear, 
                 pc_wren,
                 IFID_wren, IDEX_wren, EXMEM_wren, MEMWB_wren
);

    always @(*) begin
        if (sram_stall) begin
            pc_wren      = 1'b0;
            IFID_wren    = 1'b0;  
            IDEX_wren    = 1'b0;  
            EXMEM_wren   = 1'b0;  
            MEMWB_wren   = 1'b0;  
            IFID_clear   = 1'b0;
            IDEX_clear   = 1'b0;
            EXMEM_clear  = 1'b0;
        end else
        if(EXMEM_pcsel && (EXMEM_is_br || EXMEM_is_uncbr)) begin
            IFID_clear  = 1'b1;
            IDEX_clear  = 1'b1;
            EXMEM_clear = 1'b1;
            pc_wren     = 1'b1;
            IFID_wren   = 1'b1;      
            IDEX_wren   = 1'b1;  
            EXMEM_wren  = 1'b1;  
            MEMWB_wren  = 1'b1;      
        end else if((IDEX_rdwren && (IDEX_rd == IFID_rs1 || IDEX_rd == IFID_rs2)) || 
                    (EXMEM_rdwren && (EXMEM_rd == IFID_rs1 || EXMEM_rd == IFID_rs2))) begin
                        pc_wren    = 1'b0;
                        IFID_wren  = 1'b0;
                        IDEX_clear = 1'b1;
                        EXMEM_clear = 1'b0;
                        IFID_clear  = 1'b0;
                        IDEX_wren   = 1'b1;  
                        EXMEM_wren  = 1'b1;  
                        MEMWB_wren  = 1'b1; 
        end else begin
            IFID_clear  = 1'b0;
            IDEX_clear  = 1'b0;
            EXMEM_clear = 1'b0;
            pc_wren     = 1'b1;
            IFID_wren   = 1'b1;        
            IDEX_wren   = 1'b1;  
            EXMEM_wren  = 1'b1;  
            MEMWB_wren  = 1'b1;    
        end
    end

endmodule

