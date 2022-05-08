
###############################
# Post Clock Tree Synthesis
###############################

puts "---------- Post Clock Tree Synthesis --------------"

# Executa otimizacoes apos a CTS.

# Corrige violacoes de max_cap e max_tran.
optDesign -postCTS -drv -outDir ${REPORT}/postCTS -noOutDir

# Corrige violacoes de setup.
optDesign -postCTS -outDir ${REPORT}/postCTS -noOutDir

optDesign -postCTS -hold -outDir ${REPORT}/postCTS -noOutDir

# Executa otimizacoes incrementais quantas vezes for necessario,
optDesign -postCTS -hold -incr -outDir ${REPORT}/postCTS -noOutDir

# Salva o projeto em ./cts
saveDesign ${CTS}/${BLOCK_NAME}.enc

## Depending on the hold time violations, a post-CTS hold fixing step can be
## performed. It may help to specify setOptMode -holdTargetSlack <WNS>
## to only fix large violations (detailed fixing will be done in post-route)

