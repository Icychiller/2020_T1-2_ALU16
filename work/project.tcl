set projDir "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/vivado"
set projName "CS1DII"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/au_top_0.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/control_1.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/reset_conditioner_2.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/adder16bit_3.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/comp16bit_4.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/mult16bit_5.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/shifter_6.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/boolean_7.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/divider_8.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/button_conditioner_9.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/edge_detector_10.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/fsmcontrol_11.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/fulladder_12.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/pipeline_13.v" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/verilog/counter_14.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/constraint/alchitry.xdc" "C:/Users/Ivan\ Tandyajaya/Documents/alchitry/CS1DII/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
