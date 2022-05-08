
###############################
# Nanoroute
###############################

puts "---------- Nanoroute --------------"

# Desfixa as celulas para evitar problemas de roteamento.
changeUseClockNetStatus -noFixedNetWires

# Define as opcoes de roteamento.
source ${SCRIPT}/setRouteMode.tcl

# Executa o roteamento.
globalDetailRoute

setAnalysisMode -analysisType bcwc
setDelayCalMode -engine aae -SIAware false


puts "---------- Timing design --------------"

# Checa o tempo depois do roteamento.
timeDesign -postRoute -prefix TimingReports \
    -outDir ${REPORT}/postRoute


puts "--------- Post-route optimize ---------"

# O ultimo passo de otimizacao pos-roteamento
setOptMode -effort high
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -simplifyNetlist false
clearClockDomains
setClockDomains -all
setOptMode -usefulSkew false
optDesign -postRoute -drv -prefix TimingReports \
          -outDir ${REPORT}/postRouteOpt


# Salva o projeto em ./route
saveDesign ${ROUTE}/${BLOCK_NAME}.enc

