iiitb_gc - gray counter

The focus of this project is to implement an 8-bit gray code counter in skywater 130nm and determine its functional, pre-layout and post layout characteristics (namely power, performance and area).

Note: Circuit requires further optimization to improve performance. Design yet to be modified.
Introduction

Gray code counter is a digital counter that counts such that each successive bit patterns differs by only one bit. Unlike normal counters, there are no glitches in the count pattern (0 -> 1 -> 3 -> 2 -> 6 -> 7 ......... ). Since switching is less in gray code counters (i.e., exactly one-bit switches in one clock cycle), the power consumption of the gray code counter is significantly less compared to the normal counter.1
Application of Gray Counter

The gray code counter has various applications including analog to digital converters, error detection and correction in memory and digital communication, genetic algorithms, DNA computing, bio-informatics, optical information processing, quantum computations and nanotechnology.
Gray Code Counter - Verilog Implementation
