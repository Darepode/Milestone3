`timescale 1ns/1ps
module hdu_tb ();
    logic pcsel_exmem, is_br_exmem, is_uncbr_exmem, rdwren_idex, rdwren_exmem;    
    logic [4:0] rd_idex, rd_exmem, rs1_ifid, rs2_ifid;
    logic clear_ifid, clear_idex, clear_exmem, wren_ifid, pc_wren; 


    hdu inst_hdu (
        .EXMEM_pcsel(pcsel_exmem),         
        .EXMEM_is_br(is_br_exmem),         
        .EXMEM_is_uncbr(is_uncbr_exmem),   
        .IDEX_rdwren(rdwren_idex),         
        .IDEX_rd(rd_idex),                 
        .EXMEM_rdwren(rdwren_exmem),       
        .EXMEM_rd(rd_exmem),               
        .IFID_rs1(rs1_ifid),               
        .IFID_rs2(rs2_ifid),               
        .IFID_clear(clear_ifid),           
        .IDEX_clear(clear_idex),           
        .EXMEM_clear(clear_exmem),         
        .IFID_wren(wren_ifid),             
        .pc_wren(pc_wren)                  
    );


    integer fd;
    initial begin      
        fd = $fopen("result.log","w");
    end

    // Wave dump
    initial begin
        
        direct_test(1, 1, 0, 1, 1, 12, 13, 11, 12);
        $dumpfile("alu_tb.vcd");
        $dumpvars(0,hdu_tb);
       // #100000 $finish();
    end

    initial begin
        repeat (10) begin
            #10
            // Randomize the inputs using urandom_range
            pcsel_exmem = $urandom_range(0, 1);       // Random 0 or 1
            is_br_exmem = $urandom_range(0, 1);       // Random 0 or 1
            is_uncbr_exmem = $urandom_range(0, 1);    // Random 0 or 1
            rdwren_idex = $urandom_range(0, 1);       // Random 0 or 1
            rdwren_exmem = $urandom_range(0, 1);      // Random 0 or 1
            rd_idex = $urandom_range(0, 31);          // Random register (0-31)
            rd_exmem = $urandom_range(0, 31);         // Random register (0-31)
            rs1_ifid = $urandom_range(0, 31);         // Random register (0-31)
            rs2_ifid = $urandom_range(0, 31);         // Random register (0-31)

            // Display the randomized values for debugging
            $fdisplay(fd,"\nRandomized Inputs:");
            $fdisplay(fd,"  pcsel_exmem=%b, is_br_exmem=%b, is_uncbr_exmem=%b", pcsel_exmem, is_br_exmem, is_uncbr_exmem);
            $fdisplay(fd,"  rdwren_idex=%b, rd_idex=%0d, rdwren_exmem=%b, rd_exmem=%0d", rdwren_idex, rd_idex, rdwren_exmem, rd_exmem);
            $fdisplay(fd,"  rs1_ifid=%0d, rs2_ifid=%0d", rs1_ifid, rs2_ifid);
            #10
            direct_test(pcsel_exmem, is_br_exmem, is_uncbr_exmem, rdwren_idex, rdwren_exmem, 
                        rd_idex, rd_exmem, rs1_ifid, rs2_ifid);
        end
    end


    task direct_test(
    input bit        pcsel_exmem,   
    input bit        is_br_exmem,   
    input bit        is_uncbr_exmem,
    input bit        rdwren_idex,
    input bit        rdwren_exmem,   
    input bit [4:0]  rd_idex,       
    input bit [4:0]  rd_exmem,      
    input bit [4:0]  rs1_ifid,      
    input bit [4:0]  rs2_ifid
    ); begin
        if(pcsel_exmem && (is_br_exmem || is_uncbr_exmem)) begin
            if (inst_hdu.IFID_clear  != 1'b1 || // Updated to IFID_clear
                inst_hdu.IDEX_clear  != 1'b1 || // Updated to IDEX_clear
                inst_hdu.EXMEM_clear != 1'b1) begin // Updated to EXMEM_clear
                $fdisplay(fd,"ERROR at branch flushing");
                $fdisplay(fd,"  Expected: IFID_clear=1, IDEX_clear=1, EXMEM_clear=1");
                $fdisplay(fd,"  Got: IFID_clear=%b, IDEX_clear=%b, EXMEM_clear=%b\n", inst_hdu.IFID_clear, inst_hdu.IDEX_clear, inst_hdu.EXMEM_clear); 
            end 
        end else if((rdwren_idex && (rd_idex == rs1_ifid || rd_idex == rs2_ifid)) || 
                    (rdwren_exmem && (rd_exmem == rs1_ifid || rd_exmem == rs2_ifid))) begin
            if(inst_hdu.pc_wren    != 1'b0 || 
               inst_hdu.IFID_wren  != 1'b0 || // Updated to IFID_wren
               inst_hdu.IDEX_clear != 1'b1) // Updated to IDEX_clear
                $fdisplay(fd,"ERROR at STALLING\n");
        end else begin 
            if(inst_hdu.IFID_clear  != 1'b0 || // Updated to IFID_clear
               inst_hdu.IDEX_clear  != 1'b0 || // Updated to IDEX_clear
               inst_hdu.EXMEM_clear != 1'b0 || // Updated to EXMEM_clear
               inst_hdu.pc_wren     != 1'b1 ||
               inst_hdu.IFID_wren   != 1'b1) // Updated to IFID_wren
                $fdisplay(fd,"ERROR at DEFAULT\n");           
        end
    end    
    endtask

endmodule