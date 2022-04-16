tclmode

# Generated by Genus(TM) Synthesis Solution 17.10-p007_1, revision 1.191l
# Generated on: Sat Apr 16 12:38:51 BRT 2022 (Sat Apr 16 15:38:51 GMT 2022)

tcl_set_command_name_echo on

set_log_file ./fv/processador_6_instrucoes/rtl_to_fv_map.log -replace

usage -auto -elapse

set_verification_information ./rtl_fv_map_db

read_implementation_information fv/processador_6_instrucoes -revised fv_map

set_parallel_option -threads 4 -license "xl lp gxl lpgxl eco ecogxl" -norelease_license

set env(RC_VERSION)     "17.10-p007_1"
set env(CDN_SYNTH_ROOT) "/opt/cadence/genus/tools.lnx86"
set CDN_SYNTH_ROOT      "/opt/cadence/genus/tools.lnx86"
set env(CW_DIR) "/opt/cadence/genus/tools.lnx86/lib/chipware"
set CW_DIR      "/opt/cadence/genus/tools.lnx86/lib/chipware"
# default is to error out when module definitions are missing
set_undefined_cell black_box -noascend -both
add_search_path -library . /opt/cadence/genus/tools.lnx86/lib/tech
read_library -liberty -both /opt/cadence/tsmc_018_6M20K/tcb018gbwp7t_270a_FE/tcb018gbwp7t_270a_nldm/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcb018gbwp7t_270a/tcb018gbwp7ttc.lib

set_naming_style rc
set_naming_rule "%s\[%d\]" -instance_array
set_naming_rule "%s_reg" -register -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -instance
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -variable
set_undriven_signal Z -golden
set_hdl_options -VERILOG_INCLUDE_DIR "incdir:sep:src:cwd"
delete_search_path -all -design -golden
add_search_path ../rtl -design -golden
read_design -rangeconstraint -configuration  -enumconstraint -golden -lastmod -noelab -vhdl 93 rtl/ALU.vhd rtl/bloco_controle.vhd rtl/bloco_operacional.vhd rtl/flag0.vhd rtl/InstructionRegister.vhd rtl/MUX3x1.vhd rtl/pc.vhd rtl/processador_6_instrucoes.vhd rtl/RegisterFile.vhd rtl/somador.vhd rtl/unidade_de_controle.vhd
elaborate_design -golden -root {processador_6_instrucoes} -rootonly

read_design -verilog95  -revised -lastmod -noelab -unzip fv/processador_6_instrucoes/fv_map.v.gz
elaborate_design -revised -root {processador_6_instrucoes}

report_design_data
report_black_box
uniquify -all -nolib -golden
set_flatten_model -seq_constant
set_flatten_model -seq_constant_x_to 0
set_flatten_model -nodff_to_dlat_zero
set_flatten_model -nodff_to_dlat_feedback
#add_name_alias fv/processador_6_instrucoes/fv_map.singlebit.original_name.alias.json.gz -revised
#set_mapping_method -alias -revised
#add_renaming_rule r1alias _reg((\\\[%w\\\])*(/U\\\$%d)*)$ @1 -type dff -both
set_analyze_option -auto

write_hier_compare_dofile ./hier_tmp0.lec.do -noexact_pin_match -constraint -usage -replace -balanced_extraction -input_output_pin_equivalence -prepend_string " analyze_datapath -module -verbose ; analyze_datapath -share -verbose; "
run_hier_compare ./hier_tmp0.lec.do -dynamic_hierarchy

report_verification -hier
# report_hier_compare_result -dynamicflattened
set_system_mode lec
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
if {[get_compare_points -NONequivalent -count] > 0} {
puts "------------------------------------"
puts "ERROR: Different Key Points detected"
puts "------------------------------------"
#     foreach i [get_compare_points -NONequivalent] {
#         vpx report test vector [get_keypoint $i]
#         puts "     ----------------------------"
#     }
}

write_verification_information
report_verification_information

exit
