module Datapath (
    input clk,
    input [3:0] RA1, RA2, RA3, WA,
    input [31:0] WD,
    input RegWrite,
    input [2:0] ALUControl,
    input MLA_Select,
    output [31:0] ALUResult
);
  wire [31:0] RD1, RD2, RD3;
  wire [31:0] SrcA, SrcB, Ra;

  // Register File
  RegisterFile rf (
      .clk(clk),
      .RA1(RA1), .RA2(RA2), .RA3(RA3),
      .WA(WA), .WD(WD),
      .RegWrite(RegWrite),
      .RD1(RD1), .RD2(RD2), .RD3(RD3)
  );

  // ALU
  ALU alu (
      .SrcA(RD1),
      .SrcB(RD2),
      .Ra(RD3),  // Operando adicional para MLA
      .ALUControl(ALUControl),
      .ALUResult(ALUResult)
  );
endmodule
