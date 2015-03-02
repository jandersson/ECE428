
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Counter_Tutorial -dir "E:/Counter_Tutorial/planAhead_run_1" -part xc6slx45csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/Counter_Tutorial/counter.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/Counter_Tutorial} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "counter.ucf"
add_files "counter.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
