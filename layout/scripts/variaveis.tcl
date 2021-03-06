
###############################
# Variaveis
###############################

puts "---------- Defining Variables --------------"

# Especifica o nome do bloco
set BLOCK_NAME processador_6_instrucoes

# Especifica o nome do entregavel
set DELIVERABLE_NAME processador_6_instrucoes

# DELIVERABLES aponta para a pasta ./deliverables
set DELIVERABLES ./deliverables

# REPORT aponta para a pasta ./reports
set REPORT ./reports

# FLOORPLAN aponta para a pasta ./floorplan
set FLOORPLAN ./floorplan

# POWERPLAN aponta para a pasta ./powerplan
set POWERPLAN ./powerplan

# DATA aponta para a pasta ./data
set DATA ./data

# PLACE aponta para a pasta ./place 
set PLACE ./place

# CTS aponta para a pasta ./cts
set CTS ./cts

# ROUTE aponta para a pasta ./route
set ROUTE ./route

# METALFILL aponta para a pasta ./metalfill
set METALFILL ./metalfill

# SCRIPT aponta para a pasta ./scripts 
set SCRIPT ./scripts

# Define clockBufName
#set clockBufName {INV0 INV1 INV2 INV3 INV4 INV8 INV10 INV12 INV15}

# Define as FILLER_CELLS e FILLER_CELLS_RT
#set FILLER_CELLS {FILL25 FILL10 FILL5 FILL2}
#set FILLER_CELLS_RT {FILL25 FILL10 FILL5 FILL2}

# Habilita footprintless flow (nao e mais necessario definir footprints de buf, inv e clk)
set dbgGPSAutoCellFunction 1

# evita que instancias sejam inseridas no top_level durante sintese
set_global opt_no_new_instances_at_top_level true

