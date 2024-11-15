`timescale 1ns / 1ps

module testbench;
  reg clk;
  reg [3:0] RA1, RA2, RA3, WA;
  reg [31:0] WD;
  reg RegWrite;
  reg [2:0] ALUControl;
  reg MLA_Select;
  wire [31:0] ALUResult;
  wire [31:0] RD1, RD2, RD3;

  Datapath dp (
      .clk(clk),
      .RA1(RA1), .RA2(RA2), .RA3(RA3),
      .WA(WA),
      .WD(WD),
      .RegWrite(RegWrite),
      .ALUControl(ALUControl),
      .MLA_Select(MLA_Select),
      .ALUResult(ALUResult)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    RegWrite = 1;

    // Prueba de ADD (RA1 + RA2)
    RA1 = 4'b0000;
    RA2 = 4'b0001;
    RA3 = 4'b0010;
    WA = 4'b0011;
    WD = 32'd10;
    ALUControl = 3'b000;
    MLA_Select = 0;
    #10;

    // Prueba de MLA (RA1 * RA2 + RA3)
    ALUControl = 3'b100;
    MLA_Select = 1;
    #10;

    // Prueba de SDIV (RA1 / RA2)
    ALUControl = 3'b101;
    MLA_Select = 0;
    #10;

    // Prueba de UDIV (RA1 / RA2)
    ALUControl = 3'b110;
    MLA_Select = 0;
    #10;

    $finish;
  end

  initial begin
    $monitor("Time: %0d | ALUControl: %b | ALUResult: %d", $time, ALUControl, ALUResult);
  end
endmodule
