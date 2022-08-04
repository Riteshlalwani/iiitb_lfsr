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
- 
## LFSR - Verilog Block diagram
The Block Diagram of LFSR shown Below :-

## Functional Simulation
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
