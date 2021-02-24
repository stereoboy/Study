
#Create a XUP folder inside E Drive as: E:/XUP
#run this command one by one at your VIVADO Console

create_project project_delete E:/XUP/project_delete -part xc7z020clg484-1
file mkdir E:/XUP/project_delete/project_delete.srcs/sources_1/new
close [ open E:/XUP/project_delete/project_delete.srcs/sources_1/new/new.vhd w ]
add_files E:/XUP/project_delete/project_delete.srcs/sources_1/new/new.vhd
update_compile_order -fileset sources_1
file mkdir E:/XUP/project_delete/project_delete.srcs/constrs_1/new
close [ open E:/XUP/project_delete/project_delete.srcs/constrs_1/new/constraint.xdc w ]
add_files -fileset constrs_1 E:/XUP/project_delete/project_delete.srcs/constrs_1/new/constraint.xdc
launch_runs synth_1
launch_runs impl_1
#write_bitstream file_name.bit
launch_runs impl_1 -to_step write_bitstream -jobs 2

