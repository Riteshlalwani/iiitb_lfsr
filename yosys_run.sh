read_verilog iiitb_lfsr.v

# generic synthesis
synth -top iiitb_lfsr

# mapping to mycells.lib
dfflibmap -liberty /home/ritesh/Desktop/iiitb_lfsr/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /home/ritesh/Desktop/iiitb_lfsr/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten
write_verilog -noattr iiitb_lfsr_synth.v
stat
