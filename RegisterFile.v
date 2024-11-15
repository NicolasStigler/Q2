module RegisterFile (
    input clk,
    input [3:0] RA1, RA2, RA3,  // RA3 es para el registro Ra (operando para MLA)
    input [3:0] WA,
    input [31:0] WD,
    input RegWrite,
    output [31:0] RD1, RD2, RD3
);
  reg [31:0] regfile[15:0];

  integer i;
  initial begin
      for (i = 0; i < 16; i = i + 1) begin
          regfile[i] = 32'b0;
      end
  end

  // Lectura de registros
  assign RD1 = regfile[RA1];
  assign RD2 = regfile[RA2];
  assign RD3 = regfile[RA3];  // Nuevo puerto de lectura

  // Escritura en registros
  always @(posedge clk) begin
    if (RegWrite) regfile[WA] <= WD;
  end
endmodule
