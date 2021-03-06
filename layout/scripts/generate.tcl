
###############################
# Generate
###############################

puts "---------- Generate --------------"

# Geracao de toda informacao de pinos, necessaria em ferramentas LVS, como o Assura.
genPinText ${DELIVERABLES}/${BLOCK_NAME}.pins -cells *

# Geracao do bloco em Verilog
saveNetlist ${DELIVERABLES}/${DELIVERABLE_NAME}.v
saveNetlist -flat ${DELIVERABLES}/${DELIVERABLE_NAME}_flat.v

# Extracao do RC
setExtractRCMode -useShieldingInDetailMode false -turboReduce false -coupled true -assumeMetFill 0
extractRC

# Geracao dos arquivos SDF e DSPF
#setAnalysisMode -setup
#rcOut -worst -spf ${DELIVERABLES}/${DELIVERABLE_NAME}_worst.spf
#delayCal -sdf ${DELIVERABLES}/${DELIVERABLE_NAME}.sdf
write_sdf ${DELIVERABLES}/${DELIVERABLE_NAME}.sdf

#setAnalysisMode -hold
#rcOut -best -spf ${DELIVERABLES}/${DELIVERABLE_NAME}_best.spf
#delayCal -sdf ${DELIVERABLES}/${DELIVERABLE_NAME}_best.sdf

# Utilizacao do LefDef versao 5.4 (verificar a versao que o HITKIT v4.1 suporta)
set dbgLefDefOutVersion 5.5

# Exportando o arquivo DEF 
defOut -placement -routing -floorplan -netlist ${DELIVERABLES}/${DELIVERABLE_NAME}.def


