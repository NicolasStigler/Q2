module ControlUnit (
    input [3:0] Op,
    input [3:0] Funct,
    output reg [2:0] ALUControl,
    output reg MLA_Select
);
  always @(*) begin
    case (Op)
      4'b0000: begin  // Data Processing
        case (Funct)
          4'b0100: ALUControl = 3'b000;  // ADD
          4'b0010: ALUControl = 3'b001;  // SUB
          4'b0000: ALUControl = 3'b010;  // AND
          4'b1100: ALUControl = 3'b011;  // ORR
          4'b1010: begin
            ALUControl = 3'b100;  // MLA
            MLA_Select = 1;
          end
          4'b1000: ALUControl = 3'b101;  // SDIV
          4'b1001: ALUControl = 3'b110;  // UDIV
          default: ALUControl = 3'b000;
        endcase
      end
      default: begin
        ALUControl = 3'b000;
        MLA_Select = 0;
      end
    endcase
  end
endmodule
