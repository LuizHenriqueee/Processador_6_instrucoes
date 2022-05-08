
###############################
# Metal Fill
###############################

# Define as densidades maximas e minimas de metal em cada layer.
setMetalFill -layer 1 -windowSize 100 100 -minDensity 30 -maxDensity 70 -preferredDensity 30 -minLength 0.5 -minWidth 0.5
setMetalFill -layer 2 -windowSize 100 100 -minDensity 30 -maxDensity 70 -preferredDensity 30 -minLength 0.6 -minWidth 0.6
setMetalFill -layer 3 -windowSize 100 100 -minDensity 30 -maxDensity 70 -preferredDensity 30 -minLength 0.6 -minWidth 0.6
setMetalFill -layer 4 -windowSize 100 100 -minDensity 30 -preferredDensity 30 -minLength 0.6 -minWidth 0.6

# Verifica a densidade de metal
verifyMetalDensity -layers { MET1 MET2 MET3 MET4 } -detailed -report ${REPORT}/${BLOCK_NAME}_metalFill.rpt

# Adiciona metal fill
addMetalFill 

verifyMetalDensity -layers { MET1 MET2 MET3 MET4 } -detailed -report ${REPORT}/${BLOCK_NAME}_metalFill.rpt

# Se houver qualquer violacao em timing, DRC e conectividade causada pelo metal fill, usar o seguinte comando:
trimMetalFill

# Salva o projeto em ./metalfill
saveDesign ${METALFILL}/${BLOCK_NAME}.enc

