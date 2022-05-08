#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sun May  8 17:35:00 2022                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.10-p006_1 (64bit) 05/31/2017 11:06 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.10-p006_1 NR170516-1601/17_10-UB (database version 2.30, 378.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.10-p003 (64bit) 05/31/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.10-p002_1 () May 18 2017 07:46:32 ( )
#@(#)CDS: SYNTECH 17.10-p001_1 () May 17 2017 01:24:45 ( )
#@(#)CDS: CPE v17.10-p003
#@(#)CDS: IQRC/TQRC 16.1.1-s140 (64bit) Fri Mar 17 16:46:12 PDT 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getVersion
getDrawView
loadWorkspace -name Physical
win
set init_gnd_net VSS
set init_lef_file /opt/cadence/tsmc_018_6M20K/tcb018gbwp7t_270a_FE/tcb018gbwp7t_270a_sef/TSMCHOME/digital/Back_End/lef/tcb018gbwp7t_270a/lef/tcb018gbwp7t_6lm.lef
set init_design_settop 0
set init_verilog VERILOG/processador_6_instrucoes_out_net.v
set init_mmmc_file data/Default.view
set init_pwr_net VDD
init_design
set_global opt_no_new_instances_at_top_level true
floorPlan -site core7T -r 0.5 0.8 10 10 10 10
saveDesign ./floorplan/processador_6_instrucoes.enc
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose
globalNetConnect VSS -type tielo -inst * -verbose
globalNetConnect VDD -type tiehi -inst * -verbose
addRing -type core_rings -nets {VDD VSS} -width_left 3 -width_bottom 3 -width_top 3 -width_right 3 -spacing_bottom 2 -spacing_top 2 -spacing_right 2 -spacing_left 2 -layer_bottom METAL1 -layer_right METAL2 -layer_left METAL2 -layer_top METAL1 -center 1
addStripe -nets {VSS VDD} -layer METAL2 -width 3 -spacing 2 -number_of_sets 1 -start_offset 155
sroute -nets { VDD VSS } -straightConnections { straightWithDrcClean straightWithChanges }
checkDesign -floorplan -powerGround -noHtml -outfile ./reports/floorplanAndPowerplan/checkDesign_floorplan_powerplan.rpt
saveDesign ./powerplan/processador_6_instrucoes.enc
setPlaceMode -timingDriven -doCongOpt -modulePlan
setPlaceMode -fp false
placeDesign -prePlaceOpt
placeDesign
scanReorder
setScanReorderMode -skipNone
setScanReorderMode -skipMode skipNone
setPlaceMode -timingDriven -doCongOpt -modulePlan
setPlaceMode -fp false
placeDesign -prePlaceOpt
setScanReorderMode -skipMode skipBuffer
setPlaceMode -timingDriven -doCongOpt -modulePlan
setPlaceMode -fp false
placeDesign -prePlaceOpt
setPlaceMode -place_global_ignore_scan false
setPlaceMode -timingDriven -doCongOpt -modulePlan
setPlaceMode -fp false
placeDesign -prePlaceOpt
checkPlace
deleteBufferTree
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix counter_preCTS -outDir ./reports/preCTS
saveDesign ./place/processador_6_instrucoes.enc
ccopt_design
optDesign -postCTS -drv -outDir ./reports/postCTS -noOutDir
optDesign -postCTS -outDir ./reports/postCTS -noOutDir
optDesign -postCTS -hold -outDir ./reports/postCTS -noOutDir
optDesign -postCTS -hold -incr -outDir ./reports/postCTS -noOutDir
saveDesign ./cts/processador_6_instrucoes.enc
addFiller -cell FILL8BWP7T FILL64BWP7T FILL4BWP7T FILL32BWP7T FILL2BWP7T FILL1BWP7T FILL16BWP7T -prefix FILLER
getPlaceMode -doneQuickCTS -quiet
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeTdrEffort 10
setNanoRouteMode -quiet -drouteUseMultiCutViaEffort <default>
globalDetailRoute
setAnalysisMode -analysisType bcwc
setDelayCalMode -engine aae -SIAware false
timeDesign -postRoute -prefix TimingReports -outDir ./reports/postRoute
setOptMode -effort high
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -simplifyNetlist false
clearClockDomains
setClockDomains -all
setOptMode -usefulSkew false
optDesign -postRoute -drv -prefix TimingReports -outDir ./reports/postRouteOpt
saveDesign ./route/processador_6_instrucoes.enc
setMetalFill -layer 1 -windowSize 100 100 -minDensity 30 -maxDensity 70 -preferredDensity 30 -minLength 0.5 -minWidth 0.5
setMetalFill -layer 2 -windowSize 100 100 -minDensity 30 -maxDensity 70 -preferredDensity 30 -minLength 0.6 -minWidth 0.6
setMetalFill -layer 3 -windowSize 100 100 -minDensity 30 -maxDensity 70 -preferredDensity 30 -minLength 0.6 -minWidth 0.6
setMetalFill -layer 4 -windowSize 100 100 -minDensity 30 -preferredDensity 30 -minLength 0.6 -minWidth 0.6
verifyMetalDensity -layers { MET1 MET2 MET3 MET4 } -detailed -report ./reports/processador_6_instrucoes_metalFill.rpt
addMetalFill
verifyMetalDensity -layers { MET1 MET2 MET3 MET4 } -detailed -report ./reports/processador_6_instrucoes_metalFill.rpt
trimMetalFill
saveDesign ./metalfill/processador_6_instrucoes.enc
verifyConnectivity -type all -geomConnect -reportfile ./reports/verify/processador_6_instrucoes.conn.rpt
verifyGeometry -antenna -noSameNet -reportfile ./reports/verify/processador_6_instrucoes.geom.rpt
verifyProcessAntenna -reportfile ./reports/verify/processador_6_instrucoes.antenna.rpt -leffile ./reports/processador_6_instrucoes.antenna.lef
checkDesign -all -noHtml -outfile ./reports/verify/processador_6_instrucoes_checkDesign_verify.rpt
summaryReport -outdir ./reports/summaryReport
genPinText ./deliverables/processador_6_instrucoes.pins -cells *
saveNetlist ./deliverables/processador_6_instrucoes.v
saveNetlist -flat ./deliverables/processador_6_instrucoes_flat.v
setExtractRCMode -useShieldingInDetailMode false -turboReduce false -coupled true -assumeMetFill 0
extractRC
write_sdf ${DELIVERABLES}/${DELIVERABLE_NAME}.sdf
set dbgLefDefOutVersion 5.5
defOut -placement -routing -floorplan -netlist ./deliverables/processador_6_instrucoes.def
