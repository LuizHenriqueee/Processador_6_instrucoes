
###############################
# Floorplan
###############################

puts "---------- Floorplan --------------"

# Define o floorplan.
# floorplan -site standard -r <aspectRatio> <rowDensity> <coreToLeft> <coreToBottom> <coreToRight> <coreToTop>.
floorPlan -site core7T -r 0.5 0.8 10 10 10 10

# Salva o projeto em ./floorplan.
saveDesign ${FLOORPLAN}/${BLOCK_NAME}.enc

