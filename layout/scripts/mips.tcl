
###############################
# Principal
###############################

puts "---------- Principal --------------"

# Define as variaveis, diretorios e preferencias para o projeto -- Fixo.
source scripts/variaveis.tcl

# Configuracao do floorplan -- Variavel.
source scripts/floorplan.tcl

# Configuracao do powerplan (rings e stripes) -- Variavel.
source scripts/powerplan.tcl

# Placement das cells (realiza um pre-roteamento) -- Fixo.
source scripts/placement.tcl

# Sintese da arvore de clock (CTS) -- Fixo.
source scripts/clocktree.tcl

# Realiza otimizacoes pos-CTS -- Fixo.
source scripts/postCTS.tcl

# Adiciona as FILLER cells -- Fixo.
source scripts/fillcore.tcl

# Nanoroute (realiza o roteamento final) -- Fixo.
source scripts/nanoroute.tcl 

# Insercao dos metais de preenchimento -- Variavel (mudar os valores de acordo com o floorplan e tecnologia utilizados).
#source scripts/metalfill.tcl

# Verificacao de conectividade, geometria, antena e equivalencia logica -- Fixo.
source scripts/verify.tcl

# Gera os entregaveis (mudar o nome).
source scripts/generate.tcl


