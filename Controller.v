module control_unit(
    input wire [6:0] op,
    input wire [2:0] funct3,
    input wire func7,
    input wire zero,
    output reg branch,
    output reg jump,
    output wire PC_Src,
    output reg Mem_Write,
    output reg Mem_Read,
    output reg [1:0] Res_Src,
    output reg [2:0] alu_ctrl,
    output reg Alu_Src,
    output reg [1:0] Imm_Src,
    output reg Reg_Write
);

reg [1:0] alu_op;
wire branch_reg,jump_reg;

always @(*) begin
    case(op) 
      7'b0000011: begin
        Reg_Write = 1'b0;
        Imm_Src = 2'b00;
        Alu_Src = 1'b1;
        Mem_Write = 1'b0;
        Mem_Read = 1'b1;
        Res_Src = 2'b01;
        branch = 1'b0;
        alu_op = 2'b00;
        jump = 1'b0;
      end
      7'b0100011: begin
        Reg_Write = 1'b0;
        Imm_Src = 2'b01;
        Alu_Src = 1'b1;
        Mem_Write = 1'b1;
        Mem_Read = 1'b0;
        Res_Src = 2'b00;
        branch = 1'b0;
        alu_op = 2'b00;        
        jump = 1'b0;
      end
      7'b0110011: begin 
        Reg_Write = 1'b1;
        Imm_Src = 2'b00;
        Alu_Src = 1'b0;
        Mem_Write = 1'b0;
        Mem_Read = 1'b0;
        Res_Src = 2'b00;
        branch = 1'b0;
        alu_op = 2'b10;
        jump = 1'b0;
      end
       7'b0010011: begin
        Reg_Write = 1'b1;
        Imm_Src = 2'b00;
        Alu_Src = 1'b1;
        Mem_Write = 1'b0;
        Mem_Read = 1'b0;
        Res_Src = 2'b00;
        branch = 1'b0;
        alu_op = 2'b10;
        jump = 1'b0;
      end
      7'b1100011: begin
        Reg_Write = 1'b0;
        Imm_Src = 2'b10;
        Alu_Src = 1'b0;
        Mem_Write = 1'b0;
        Mem_Read = 1'b0;
        Res_Src = 2'b00;
        branch = 1'b1;
        alu_op = 2'b01;
        jump = 1'b0;
      end
      7'b1101111: begin
        Reg_Write = 1'b1;
        Imm_Src = 2'b11;
        Alu_Src = 1'b0;
        Mem_Write = 1'b0;
        Mem_Read = 1'b0;
        Res_Src = 2'b10;
        branch = 1'b0;
        alu_op = 2'b00;
        jump = 1'b1;
      end
      default: begin
        Reg_Write = 1'b0;
        Imm_Src = 2'b00;
        Alu_Src = 1'b0;
        Mem_Write = 1'b0;
        Mem_Read = 1'b0;
        Res_Src = 2'b10;
        branch = 1'b0;
        alu_op = 2'b00;
        jump = 1'b1;
      end            
    endcase
end

always @(*) begin
    case(alu_op) 
      2'b00: begin
        alu_ctrl = 3'b000;
      end
      2'b01: begin
        alu_ctrl = 3'b001;
      end
      2'b10: begin
    case({funct3,op[5],func7}) 
      5'b00000: begin
        alu_ctrl = 3'b000;
      end
      5'b00001: begin
        alu_ctrl = 3'b000;
      end
      5'b00010: begin
        alu_ctrl = 3'b000;
      end
      5'b00011: begin
        alu_ctrl = 3'b001;
      end
      ////////
      5'b01000: begin
        alu_ctrl = 3'b101;
      end
      5'b01001: begin
        alu_ctrl = 3'b101;
      end
      5'b01010: begin
        alu_ctrl = 3'b101;
      end
      5'b01011: begin
        alu_ctrl = 3'b101;
      end     
      /////////////             
       5'b11000: begin
        alu_ctrl = 3'b011;
      end
      5'b11001: begin
        alu_ctrl = 3'b011;
      end
      5'b11010: begin
        alu_ctrl = 3'b011;
      end
      5'b11011: begin
        alu_ctrl = 3'b011;
      end 
      //////// 
       5'b11100: begin
        alu_ctrl = 3'b010;
      end
      5'b11101: begin
        alu_ctrl = 3'b010;
      end
      5'b11110: begin
        alu_ctrl = 3'b010;
      end
      5'b11111: begin
        alu_ctrl = 3'b010;
      end 
      ////////       
      default: begin
        alu_ctrl = 3'b000;
      end            
    endcase
      end
      default: begin
        alu_ctrl = 3'b000;
      end            
    endcase
end

assign branch_reg = branch;
assign jump_reg = jump;
assign PC_Src =  (zero & branch_reg) | jump_reg;

endmodule
