
###############################
# Powerplan
###############################

puts "---------- Powerplan --------------"

# Conecta as global nets.
clearGlobalNets

# Power nets.
globalNetConnect VDD -type pgpin -pin VDD  -inst * -verbose

# Ground nets.
globalNetConnect VSS -type pgpin -pin VSS  -inst * -verbose

# Tiehi / Tielo.
globalNetConnect VSS -type tielo -inst * -verbose
globalNetConnect VDD -type tiehi -inst * -verbose

# Adiciona power rings.
addRing -type core_rings -nets {VDD VSS} \
-width_left 3 -width_bottom 3 -width_top 3 -width_right 3 \
-spacing_bottom 2 -spacing_top 2 -spacing_right 2 -spacing_left 2 \
-layer_bottom METAL1 -layer_right METAL2  -layer_left METAL2 -layer_top METAL1 \
-center 1

# Adiciona um power stripe.
addStripe -nets {VSS VDD} \
-layer METAL2 \
-width 3 \
-spacing 2 \
-number_of_sets 1 \
-start_offset 155

# Roteia as power nets.
sroute -nets { VDD VSS } \
-straightConnections { straightWithDrcClean straightWithChanges } 

# Verificacao do floorplan e o powerplan.
checkDesign -floorplan -powerGround -noHtml -outfile ${REPORT}/floorplanAndPowerplan/checkDesign_floorplan_powerplan.rpt

# Salva o projeto em ./powerplan.
saveDesign ${POWERPLAN}/${BLOCK_NAME}.enc





