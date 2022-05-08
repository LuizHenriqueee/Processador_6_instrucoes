#!/bin/bash

###############################
# Setup
###############################
#
# Arquivos necessarios:
#
# 1) Arquivo inicial de configuracao (arquivo .conf)
# 2) Netlist estrutural em Verilog, gerada apos a sintese logica (arquivo .v) -- gerado com o Genus
# 3) Arquivo de restricoes de tempo (arquivo .sdc) -- gerado com o Genus
# 4) Arquivo de configuracao do MMMC view (Default.view)
# 5) setup.sh
#
# Instrucoes:
# Dado um diretorio de trabalho, copie, para dentro deste, os arquivos de 1 a 5.
# Uma vez copiados, execute o script setup.sh.
# Se houver algum erro, por favor cheque as permissoes de usuario.
# Use ~chmod 777~ como superuser para definir ao arquivo as permissoes necessarias.
#

# Criacao da arvore de diretorios.
mkdir deliverables
mkdir reports
mkdir floorplan
mkdir powerplan
mkdir place
mkdir data
mkdir cts
mkdir route
mkdir SDC
mkdir VERILOG

# Copiando e movendo os arquivos para as pastas corretas.
cp ../synth/logic_synthesis_output_files/processador_6_instrucoes_out_net.v VERILOG
cp ../synth/logic_synthesis_output_files/processador_6_instrucoes_out_sdc.sdc SDC
mv tsmc_init_design.conf data
mv Default.view data
