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


