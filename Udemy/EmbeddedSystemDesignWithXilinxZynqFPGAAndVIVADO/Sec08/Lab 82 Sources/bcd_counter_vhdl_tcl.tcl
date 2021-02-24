

#Digitronix Nepal
#Udemy Online Course on Embedded System Design with VIVADO and Zynq FPGA

#this is the main tcl file which creates the project of bcd_counter and Add the the vhdl source and xdc source on the project
#did the synthesis, implementation and Bit stream generation automatically

#you dont need to do anything on this source; you can only change the directory accordint to you want!


#cd E:/xup/Udemy_Embedded_august/bcd_counter_tcl
create_project bcd_counter E:/XUP/bcd_counter -part xc7z020clg484-1
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property target_language VHDL [current_project]
import_files -norecurse E:/XUP/bcd_vhd.vhd
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
add_files -fileset constrs_1 -norecurse E:/XUP/bcd_xdc.xdc
import_files -fileset constrs_1 E:/XUP/bcd_xdc.xdc
launch_runs synth_1 -jobs 2
#launch_runs impl_1 -jobs 2
launch_runs impl_1 -to_step write_bitstream -jobs 2
