
###############################
# Placement
###############################

puts "---------- Placement --------------"

# Define as opcoes de placement.
source $SCRIPT/setPlaceMode.tcl

# Executa o placement das celulas.
setPlaceMode -fp false
placeDesign -prePlaceOpt

# Checa o placement.
checkPlace

# Remove buffer e double-inverter.
deleteBufferTree

timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix counter_preCTS -outDir ${REPORT}/preCTS

# Salva o projeto em ./place.
saveDesign ${PLACE}/${BLOCK_NAME}.enc

