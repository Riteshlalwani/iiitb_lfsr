# iiit_lfsr- Linear feedback shift register
## Description

The Aim of this exercise is to design a linear feedback shift register to produce a random number sequence. We would be using 130nm technology node by Skywater. We would also understand the functionality, pre-layout and post-layout characterstics.

Note: Circuit requires further optimization to improve performance. Design yet to be modified.

## Introduction

Linear feedback shift register has 4 d-flipflops and a Ex-or Gate. We would also use multiplexers to initialize the sequence. This design would generate a sequence of numbers(bits). Although the sequence generated can be predicted by observing the previous bits as it would be repeating a cycle. However we can modify the circuit and its feedback paths to make it look more random and decrease the predictibilty.

## Application of LFSR(Linear feedback shift register)
LFSR counter has various applications
- *Uses in cryptograpgy*
- *Uses in circuit testing*
- *Uses in puzzles and games*

## LFSR - Verilog Block diagram
The Block Diagram of LFSR shown Below :-
[^2]<br>
 <p align="center">
  <img width="650" height="320" src="/images/blockdiagram.jpg">
</p><br>

## Functional Simulation
## Waveform :- 
[^3]<br>
 <p align="center">
  <img width="1000" height="200" src="/images/rtl_waveform.jpg">
</p><br>

### Softwares used
### - **iverilog**
Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format. [^3]

### - **gtkwave**
GTKWave is a fully featured GTK+ based wave viewer for Unix, Win32, and Mac OSX which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing. [^4]

### 1) Installing necessary softwares:
  ```
  $ sudo apt-get install git 
  
  $ sudo apt-get install iverilog 
  
  $ sudo apt-get install gtkwave 
  ```
  ### 2) Executing the Project:
  ```
  $ git clone 
  
  $ cd iiitb_lfsr
  
  $ iverilog iiitb_lfsr.v iiitb_lfsr_tb.v -o iiitb_lfsr
  
  $ ./iiitb_lfsr
  
  $ gtkwave iiitb_lfsr.vcd
  ```
  ## Gate Level Simulation

GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.

1. Go to the directory where verilog code is present and open the terminal.

2. Invoke yosys.

Give the following commands for synthesis:

```
// reads the library file from sky130//
yosys> read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

// reads the verilog files//
yosys> read_verilog iiitb_lfsr.v

//synthesize the top module of verilog file//
yosys> synth -top iiitb_lfsr

//Generates netlist//
yosys> abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

//Simplified netlist//
yosys> flatten

//Displays the Netlist circuit//
yosys> show

```
### Synthesized Circuit
^5]<br>
 <p align="center">
  <img width="1000" height="500" src="/images/synthesized_circuit.jpg">
</p><br>





```
//Writing Netlist//
yosys> write_verilog -noattr iiitb_lfsr_net.v
```

3. Invoke GLS

```
$ iverilog ../verilog_model/primitives.v ../verilog_model/sky130_fd_sc_hd.v iiitb_lfsr_net.v iiitb_lfsr_tb.v
$ ./a.out
$ gtkwave iiitb_lfsr_tb.vcd
```

4. Gate Level Simulation
[^5]<br>
 <p align="center">
  <img width="1000" height="600" src="/images/GLS_waveform.jpg">
</p><br>


  
  ## Contributors

- **Ritesh Lalwani**
- **Kunal Ghosh**
- **Tejas B N**

## Acknowledgments


- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
- Madhav Rao, Associate Professor, IIIT Bangalore
- V N Muralidhara,Mtech Coordinator, Associate Professor, IIIT Bangalore
  
  
```
## Contact Information

- Ritesh Lalwani, Mtech ECE student, International Institute of Information Technology, Bangalore  ritesh7328@gmail.com
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com
