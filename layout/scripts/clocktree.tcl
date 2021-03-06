
###############################
# Clock Tree Synthesis
###############################

puts "---------- Clock Tree Synthesis --------------"

# A arvore de clock sera sintetizada utilizando-se da informacao definida no 'setCTSMode.tcl' e descrita no arquivo SDC, de restricoes de tempo (timing constraints).
# As opcoes no arquivo de especificacao da arvore de clock terao prioridade sobre as opcoes descritas pelo 'setCTSMode.tcl'. Portanto, defina uma especificacao
# global in 'setCTSMode.tcl' e defina a informacao especifica do clock no arquivo de especificao de arvore de clock.
#source ${SCRIPT}/setCTSMode.tcl

# Gera o arquivo de especificacao de arvore de clock (clock tree specification file) e o edita incluindo qualquer informacao necessaria, antes da CTS.
#clockDesign -genSpecOnly ${CTS}/${BLOCK_NAME}.ctstch

# Especifica o arquivo de especificacao de arvore de clock (clock tree specification file) para checar o log.
#specifyClockTree -file ${CTS}/${BLOCK_NAME}.ctstch

#setExtractRCMode -useShieldingInDetailMode true -turboReduce false -assumeMetFill

# Executa a CTS.
#set_clock_propagation propagated
#clockDesign -specFile ${CTS}/${BLOCK_NAME}.ctstch -outDir ${CTS}

# Mostra a clock-tree.
#displayClockTree -skew -allLevel -clkRouteOnly
#displayClockPhaseDelay -clkRouteOnly

# Limpa a clock-tree.
#clearClockDisplay

# Checa o tempo depois da CTS.
#setExtractRCMode -useShieldingInDetailMode true -turboReduce false -assumeMetFill

ccopt_design

# Salva o projeto em ./cts.
saveDesign ${CTS}/${BLOCK_NAME}.enc

