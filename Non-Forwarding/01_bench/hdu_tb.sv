`timescale 1ns/1ps
module hdu_tb ();
    logic pcsel_exmem, is_br_exmem, is_uncbr_exmem, rdwren_idex, rdwren_exmem;    
    logic [4:0] rd_idex, rd_exmem, rs1_ifid, rs2_ifid;
    logic clear_ifid, clear_idex, clear_exmem, wren_ifid, pc_wren; 


    hdu inst_hdu(
        .pcsel_exmem(pcsel_exmem),       
        .is_br_exmem(is_br_exmem),       
        .is_uncbr_exmem(is_uncbr_exmem), 
        .rdwren_idex(rdwren_idex),       
        .rd_idex(rd_idex),               
        .rdwren_exmem(rdwren_exmem),     
        .rd_exmem(rd_exmem),             
        .rs1_ifid(rs1_ifid),             
        .rs2_ifid(rs2_ifid),             
        .clear_ifid(clear_ifid),         
        .clear_idex(clear_idex),         
        .clear_exmem(clear_exmem),       
        .wren_ifid(wren_ifid),           
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
            if (inst_hdu.clear_ifid  != 1'b1 ||
                inst_hdu.clear_idex  != 1'b1 ||
                inst_hdu.clear_exmem != 1'b1) begin $fdisplay(fd,"ERROR at branch flushing");
                                                    $fdisplay(fd,"  Expected: clear_ifid=1, clear_idex=1, clear_exmem=1");
                                                    $fdisplay(fd,"  Got: clear_ifid=%b, clear_idex=%b, clear_exmem=%b\n", inst_hdu.clear_ifid, inst_hdu.clear_idex, inst_hdu.clear_exmem); end 
        end else if((rdwren_idex && (rd_idex == rs1_ifid || rd_idex == rs2_ifid)) || 
                    (rdwren_exmem && (rd_exmem == rs1_ifid || rd_exmem == rs2_ifid))) begin
                      if(inst_hdu.pc_wren    != 1'b0 || 
                        inst_hdu.wren_ifid   != 1'b0 ||
                        inst_hdu.clear_idex  != 1'b1) $fdisplay(fd,"ERROR at STALLING\n");
        end else begin 
         if(inst_hdu.clear_ifid     != 1'b0 ||
            inst_hdu.clear_idex     != 1'b0 ||
            inst_hdu.clear_exmem    != 1'b0 ||
            inst_hdu.pc_wren        != 1'b1 ||
            inst_hdu.wren_ifid      != 1'b1) $fdisplay(fd,"ERROR at DEFAULT\n");           
        end
    end     
        
    endtask

endmodule