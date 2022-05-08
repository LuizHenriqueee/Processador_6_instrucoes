
###############################
# Verify
###############################

puts "---------- Verify --------------"


puts "---------- Connectivity --------------"

# Checar conectividade.
verifyConnectivity -type all -geomConnect -reportfile ${REPORT}/verify/${BLOCK_NAME}.conn.rpt


puts "---------- Geometry --------------"

# Checar geometria.
verifyGeometry  -antenna -noSameNet -reportfile ${REPORT}/verify/${BLOCK_NAME}.geom.rpt


puts "---------- Antenna --------------"

# Checar antenna.
verifyProcessAntenna -reportfile ${REPORT}/verify/${BLOCK_NAME}.antenna.rpt -leffile ${REPORT}/${BLOCK_NAME}.antenna.lef


puts "---------- Check Design --------------"

# Checar qualquer informacao perdida/faltando no projeto.
checkDesign -all -noHtml -outfile ${REPORT}/verify/${BLOCK_NAME}_checkDesign_verify.rpt


puts "---------- Summary --------------"

# Gerar um relatorio final.
summaryReport -outdir ${REPORT}/summaryReport

