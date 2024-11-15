module ALU (
    input [31:0] SrcA, SrcB, Ra,  // Ra es el tercer operando para MLA
    input [2:0] ALUControl,       // Ampliado a 3 bits para incluir las nuevas operaciones
    output reg [31:0] ALUResult
);
  always @(*) begin
    case (ALUControl)
      3'b000:  ALUResult = SrcA + SrcB;         // ADD
      3'b001:  ALUResult = SrcA - SrcB;         // SUB
      3'b010:  ALUResult = SrcA & SrcB;         // AND
      3'b011:  ALUResult = SrcA | SrcB;         // ORR
      3'b100:  ALUResult = (SrcA * SrcB) + Ra;  // MLA
      3'b101:  ALUResult = SrcA / SrcB;         // SDIV
      3'b110:  ALUResult = SrcA / SrcB;         // UDIV (igual en single cycle)
      default: ALUResult = 32'b0;
    endcase
  end
endmodule
