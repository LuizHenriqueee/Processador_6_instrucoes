
###############################
# setRouteMode
###############################

# Configura o Nanoroute para fazer o roteamento final.
getNanoRouteMode -quiet
getNanoRouteMode -quiet -envSuperthreading
getNanoRouteMode -quiet -drouteFixAntenna
getNanoRouteMode -quiet -routeInsertAntennaDiode
getNanoRouteMode -quiet -routeAntennaCellName
getNanoRouteMode -quiet -timingEngine
getNanoRouteMode -quiet -routeWithTimingDriven
setNanoRouteMode -quiet -routeWithTimingDriven true
getNanoRouteMode -quiet -routeWithEco
getNanoRouteMode -quiet -routeWithSiDriven
getNanoRouteMode -quiet -routeTdrEffort
setNanoRouteMode -quiet -routeTdrEffort 10
getNanoRouteMode -quiet -routeWithSiPostRouteFix
getNanoRouteMode -quiet -drouteAutoStop
getNanoRouteMode -quiet -routeSelectedNetOnly
getNanoRouteMode -quiet -drouteStartIteration
getNanoRouteMode -quiet -envNumberProcessor
getNanoRouteMode -quiet -envSuperthreading
getNanoRouteMode -quiet -routeTopRoutingLayer
getNanoRouteMode -quiet -routeBottomRoutingLayer
getNanoRouteMode -quiet -drouteEndIteration
getNanoRouteMode -quiet -routeEcoOnlyInLayers
setNanoRouteMode -quiet -drouteUseMultiCutViaEffort <default>

