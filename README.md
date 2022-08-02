# iiit_lfsr- Linear feedback shift register
## Description
The Aim of this exercise is to design a linear feedback shift register to produce a random number sequence. We would be using 130nm technology node by Skywater. We would also understand the functionality, pre-layout and post-layout characterstics.

Note: Circuit requires further optimization to improve performance. Design yet to be modified.
Introduction

Gray code counter is a digital counter that counts such that each successive bit patterns differs by only one bit. Unlike normal counters, there are no glitches in the count pattern (0 -> 1 -> 3 -> 2 -> 6 -> 7 ......... ). Since switching is less in gray code counters (i.e., exactly one-bit switches in one clock cycle), the power consumption of the gray code counter is significantly less compared to the normal counter.1
Application of Gray Counter

The gray code counter has various applications including analog to digital converters, error detection and correction in memory and digital communication, genetic algorithms, DNA computing, bio-informatics, optical information processing, quantum computations and nanotechnology.
Gray Code Counter - Verilog Implementation
