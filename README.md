# Q2
- Compilar con icarus
```
iverilog -o datapath_tb ALU.v RegisterFile.v ControlUnit.v Datapath.v testbench.v
```
- Ejecutar la simulacion
```
vvp datapath_tb
```
- Dumpear el GTKWave
```
gtkwave dump.vcd
```
