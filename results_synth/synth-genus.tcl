#===========================================================================
#
#	
#	Script for Cadence Genus
#
#	Use with:
#	genus -gui
#	source synth_rtl_mips8.tcl
#
#
#	Ref.: 	Joao Pedro da Silva Cerqueira
#		Erik Brunvand, 2008 - University of Utah
#		GAPH/FACIN/PUCRS
#
#	Date: March 9th, 2022
#
#===========================================================================

## 0) load libraries
set DK_PATH  "/opt/cadence/tsmc_018_6M20K/tcb018gbwp7t_270a_FE/tcb018gbwp7t_270a_nldm/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcb018gbwp7t_270a" 
set_db library "${DK_PATH}/tcb018gbwp7ttc.lib"
set_db information_level 9
set_db init_hdl_search_path ../rtl

# Name of top level module
set basename processador_6_instrucoes

# Name appended to output files
set runname out

## 1) load synthesis configuration, read description and elaborate design 
read_hdl -vhdl rtl/ALU.vhd rtl/bloco_controle.vhd rtl/bloco_operacional.vhd rtl/flag0.vhd rtl/InstructionRegister.vhd rtl/MUX3x1.vhd rtl/pc.vhd rtl/memD.vhd rtl/processador_6_instrucoes.vhd rtl/RegisterFile.vhd rtl/somador.vhd rtl/unidade_de_controle.vhd
elaborate ${basename}

## 2) read constraints
read_sdc constraints/proc_constr.sdc

## 3) synthesize to generic
syn_gen

## 4) synthesize to mapped
syn_map

# Write out the reports
report timing > logic_synthesis_output_files/${basename}_${runname}_timing.rep
report gates > logic_synthesis_output_files/${basename}_${runname}_cell.rep
report power > logic_synthesis_output_files/${basename}_${runname}_power.rep

# Write out the structural Verilog, sdc and sdf files
write_hdl -mapped >  logic_synthesis_output_files/${basename}_${runname}_net.v
write_sdc >  logic_synthesis_output_files/${basename}_${runname}_sdc.sdc
write_sdf >  logic_synthesis_output_files/${basename}_${runname}_sdf.sdf
