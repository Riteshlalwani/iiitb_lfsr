# iiit_lfsr- Linear feedback shift register
## Description

The Aim of this exercise is to design a linear feedback shift register to produce a random number sequence. We would be using 130nm technology node by Skywater. We would also understand the functionality, pre-layout and post-layout characterstics.

Note: Circuit requires further optimization to improve performance. Design yet to be modified.

## Introduction

Linear feedback shift register has 4 d-flipflops and a Ex-or Gate. We would also use multiplexers to initialize the sequence. This design would generate a sequence of numbers(bits). Although the sequence generated can be predicted by observing the previous bits as it would be repeating a cycle. However we can modify the circuit and its feedback paths to make it look more random and decrease the predictibilty. [^1]

## Application of LFSR(Linear feedback shift register)
LFSR counter has various applications
- *Uses in cryptograpgy*
- *Uses in circuit testing*
- *Uses in puzzles and games*

## LFSR - Verilog Block diagram
The Block Diagram of LFSR shown Below :-
<br>
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
Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format. [^2]

### - **gtkwave**
GTKWave is a fully featured GTK+ based wave viewer for Unix, Win32, and Mac OSX which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing. [^3]

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
  
  While performing GLS we use skywater 130 nm technology library files to import the cells from the library. Using those cells we then generate the netlist which would be a new .v file generated by write_verilog command. With this file and the testbench we generated for the RTL simulation we would again get a new waveform for this GLS netlist. This waveform should match with our initial waveform, infact waveforms if every stages of the flow should match the initial design waveform.


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
[^4]<br>
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
<br>
 <p align="center">
  <img width="1000" height="200" src="/images/GLS_waveform.jpg">
</p><br>

## PHYSICAL DESIGN
#### Openlane
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.

more at https://github.com/The-OpenROAD-Project/OpenLane
#### Installation instructions 
```
$   apt install -y build-essential python3 python3-venv python3-pip
```
Docker installation process: https://docs.docker.com/engine/install/ubuntu/

goto home directory->
```
$   git clone https://github.com/The-OpenROAD-Project/OpenLane.git
$   cd OpenLane/
$   sudo make
```
To test the open lane
```
$ sudo make test
```
It takes approximate time of 5min to complete. After 43 steps, if it ended with saying **Basic test passed** then open lane installed succesfully.

#### Magic
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow.

More about magic at http://opencircuitdesign.com/magic/index.html

Run following commands one by one to fulfill the system requirement.

```
$   sudo apt-get install m4
$   sudo apt-get install tcsh
$   sudo apt-get install csh
$   sudo apt-get install libx11-dev
$   sudo apt-get install tcl-dev tk-dev
$   sudo apt-get install libcairo2-dev
$   sudo apt-get install mesa-common-dev libglu1-mesa-dev
$   sudo apt-get install libncurses-dev
```
**To install magic**
goto home directory

```
$   git clone https://github.com/RTimothyEdwards/magic
$   cd magic/
$   ./configure
$   sudo make
$   sudo make install
```
type **magic** terminal to check whether it installed succesfully or not. type **exit** to exit magic.

**Generating Layout**


Open terminal in home directory
```
$   cd OpenLane/
$   cd designs/
$   mkdir iiitb_lfsr
$   cd iiitb_lfsr/
$   wget https://raw.githubusercontent.com/riteshlalwani/iiitb_lfsr/main/config.json
$   mkdir src
$   cd src/
$   wget https://raw.githubusercontent.com/riteshlalwani/iiitb_lfsr/main/.v
$   cd ../../../
$   sudo make mount
$   ./flow.tcl -design iiitb_lfsr
```


To see the layout we use a tool called magic which we installed earlier.

open terminal in home directory
```
$   cd OpenLane/designs/iiitb_lfsr/run
$   ls
```
select most run directoy from list 


```
$  cd RUN_2022.08.24_18.20.10
```
run following instruction
```
$   cd results/final/def
```
update the highlited text with appropriate path 

$   magic -T /home/parallels/Desktop/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../../tmp/merged.max.lef def read iiitb_lfsr.def &
```
layout will be open in new window
```
## Stats after placeing the vsdinv in our design
We can observe here the number of cells being used and also the different skywater blocks like d-flipflops and all other wires being used.
Here the area of our design is also mentioned, which in our case comes out to be 200.192 um^2.
There are four inverters being used, all of them are replaced by our designed vsdinv.

![Screenshot from 2022-08-31 12-18-57](https://user-images.githubusercontent.com/110079763/187886907-7740ef4e-e8e3-4bc0-a510-a7604e851c14.png)



## Floorplan





![placement](https://user-images.githubusercontent.com/110079763/187632183-f1a580c5-eae5-4295-9b56-ff983efd4ff5.png)
## Process for getting to the floorplan

After merging the vsdinv with our design we have to get started with the commands to run synthesis and floorplan in our design. Following commands will be given:-
#Synthesis
For the synthesis we would run the command run_synthesis 
For floorplan we would first use
init_floorplan
and then
run_floorplan
For timing analysis and slack contraints we would use cts command:-
run_cts

```

![Screenshot from 2022-08-30 19-01-36](https://user-images.githubusercontent.com/110079763/187889804-6ba1a741-238f-4185-b40b-1fb7cb6fa347.png)

### vsdinv inside the LFSR Floorplan

![vsdinv in placement](https://user-images.githubusercontent.com/110079763/187632938-305b182d-140b-4e9d-9dfa-65122378120c.png)

## Future work:
working on **GLS for post-layout netlist**.
  
  ## Contributors

- **Ritesh Lalwani**
- **Kunal Ghosh**
- **Tejas B N**

## Acknowledgments


- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
- Madhav Rao, Associate Professor, IIIT Bangalore
- V N Muralidhara,Mtech Coordinator, Associate Professor, IIIT Bangalore
  
  
```
# Contact Information

- Ritesh Lalwani, Mtech ECE student, International Institute of Information Technology, Bangalore  ritesh7328@gmail.com
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com
  
```
# *References*
[^1]:Texas instruments website [TI website](https://www.ti.com/lit/an/scta036a/scta036a.pdf)

[^2]: Icarus Verilog - [iverilog](http://iverilog.icarus.com/)

[^3]: GTK Wave [documentation](http://gtkwave.sourceforge.net/gtkwave.pdf)

[^4]: [Yosys](https://yosyshq.net/yosys/) synthesis tool
