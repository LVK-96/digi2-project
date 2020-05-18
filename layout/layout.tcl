#######################################################
#
#  Innovus Command Logging File
#  Created on Mon May 18 13:24:10 2020
#
#######################################################

#@(#)CDS: Innovus v18.10-p002_1 (64bit) 05/29/2018 19:19 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 18.10-p002_1 NR180522-1057/18_10-UB (database version 2.30, 418.7.1) {superthreading v1.46}
#@(#)CDS: AAE 18.10-p004 (64bit) 05/29/2018 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 18.10-p003_1 () May 15 2018 10:23:07 ( )
#@(#)CDS: SYNTECH 18.10-a012_1 () Apr 19 2018 01:27:21 ( )
#@(#)CDS: CPE v18.10-p005
#@(#)CDS: IQRC/TQRC 18.1.1-s118 (64bit) Fri Mar 23 17:23:45 PDT 2018 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_gnd_net vss!
set init_lef_file {../techlibs/gsclib045_tech.lef ../techlibs/gsclib045_macro.lef}
set init_design_settop 0
set init_verilog ../netlist/pic16f84a.v
set init_mmmc_file default.view
set init_pwr_net vdd!
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CoreSite -r 0.998762117302 0.699999 15 15 15 15
uiSetTool select
getIoFlowFlag
fit
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell top -pin {program_mem_addr_in[0]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[1]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[2]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[3]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[4]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[5]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[6]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[7]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[8]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[9]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[10]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[11]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_addr_in[12]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[0]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[1]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[2]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[3]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[4]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[5]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[6]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[7]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[8]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[9]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[10]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[11]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[12]} -status unplaced -silent
setPtnPinStatus -cell top -pin {program_mem_d_in[13]} -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 1 -spreadType center -spacing 0.2 -pin {{program_mem_addr_in[0]} {program_mem_addr_in[1]} {program_mem_addr_in[2]} {program_mem_addr_in[3]} {program_mem_addr_in[4]} {program_mem_addr_in[5]} {program_mem_addr_in[6]} {program_mem_addr_in[7]} {program_mem_addr_in[8]} {program_mem_addr_in[9]} {program_mem_addr_in[10]} {program_mem_addr_in[11]} {program_mem_addr_in[12]} {program_mem_d_in[0]} {program_mem_d_in[1]} {program_mem_d_in[2]} {program_mem_d_in[3]} {program_mem_d_in[4]} {program_mem_d_in[5]} {program_mem_d_in[6]} {program_mem_d_in[7]} {program_mem_d_in[8]} {program_mem_d_in[9]} {program_mem_d_in[10]} {program_mem_d_in[11]} {program_mem_d_in[12]} {program_mem_d_in[13]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.06 -pinDepth 0.335 -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 4 -spreadType center -spacing 0.2 -pin {{program_mem_addr_in[0]} {program_mem_addr_in[1]} {program_mem_addr_in[2]} {program_mem_addr_in[3]} {program_mem_addr_in[4]} {program_mem_addr_in[5]} {program_mem_addr_in[6]} {program_mem_addr_in[7]} {program_mem_addr_in[8]} {program_mem_addr_in[9]} {program_mem_addr_in[10]} {program_mem_addr_in[11]} {program_mem_addr_in[12]} {program_mem_d_in[0]} {program_mem_d_in[1]} {program_mem_d_in[2]} {program_mem_d_in[3]} {program_mem_d_in[4]} {program_mem_d_in[5]} {program_mem_d_in[6]} {program_mem_d_in[7]} {program_mem_d_in[8]} {program_mem_d_in[9]} {program_mem_d_in[10]} {program_mem_d_in[11]} {program_mem_d_in[12]} {program_mem_d_in[13]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 4 -spreadType center -spacing 0.2 -pin {{porta[0]} {porta[1]} {porta[2]} {porta[3]} {porta[4]} {portb[0]} {portb[1]} {portb[2]} {portb[3]} {portb[4]} {portb[5]} {portb[6]} {portb[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.08 -pinDepth 0.25 -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 4 -spreadType center -spacing 0.2 -pin {{porta[0]} {porta[1]} {porta[2]} {porta[3]} {porta[4]} {portb[0]} {portb[1]} {portb[2]} {portb[3]} {portb[4]} {portb[5]} {portb[6]} {portb[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 10 -pin {clk idec_enable idec_reset pc_reset}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType center -spacing 10 -pin {program_mem_reset ram_reset w_reg_reset program_mem_we}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.08 -pinDepth 0.25 -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 0.2 -pin idec_enable
setPinAssignMode -pinEditInBatch false
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {vdd! vss!} -type core_rings -follow core -layer {top Metal9 bottom Metal9 left Metal8 right Metal8} -width {top 4.5 bottom 4.5 left 4.5 right 4.5} -spacing {top 2 bottom 2 left 2 right 2} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {vdd! vss!} -layer Metal8 -direction vertical -width 4.5 -spacing 2 -number_of_sets 3 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { corePin } -layerChangeRange { Metal1(1) Metal11(11) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { vdd! vss! } -allowLayerChange 1 -targetViaLayerRange { Metal1(1) Metal11(11) }
setDrawView place
setDesignMode -process 45
setMaxRouteLayer 6
setMultiCpuUsage -localCpu 8 -cpuPerRemoteHost 1 -remoteHost 0 -keepLicense true
setDistributeHost -local
setPlaceMode -fp false
place_design
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.08 -pinDepth 0.25 -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 10 -pin {pc_reset idec_reset idec_enable clk}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.08 -pinDepth 0.25 -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 10.0 -pin {pc_reset idec_reset idec_enable clk}
setPinAssignMode -pinEditInBatch false
setPlaceMode -fp false
place_design
getCTSMode -engine -quiet
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
gui_select -rect {526.054 517.460 673.107 404.627}
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteSpreadWire 1
setNanoRouteMode -quiet -droutePostRouteWidenWireRule LEFSpecialRouteSpec
setNanoRouteMode -quiet -drouteUseMultiCutViaEffort medium
setNanoRouteMode -quiet -timingEngine {}
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X4LVT DLY4X1LVT DLY3X4LVT DLY3X1LVT DLY2X4LVT DLY2X1LVT DLY1X4LVT DLY1X1LVT CLKBUFX8LVT CLKBUFX6LVT CLKBUFX4LVT CLKBUFX3LVT CLKBUFX20LVT CLKBUFX2LVT CLKBUFX16LVT CLKBUFX12LVT BUFX8LVT BUFX6LVT BUFX4LVT BUFX3LVT BUFX20LVT BUFX2LVT BUFX16LVT BUFX12LVT INVXLLVT INVX8LVT INVX6LVT INVX4LVT INVX3LVT INVX20LVT INVX2LVT INVX16LVT INVX12LVT INVX1LVT CLKINVX8LVT CLKINVX6LVT CLKINVX4LVT CLKINVX3LVT CLKINVX20LVT CLKINVX2LVT CLKINVX16LVT CLKINVX12LVT CLKINVX1LVT} -maxAllowedDelay 1
ccopt_design
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postCTS
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postCTS -hold
setNanoRouteMode -quiet -routeInsertAntennaDiode 1
setNanoRouteMode -quiet -routeAntennaCellName ANTENNALVT
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
addMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11 }
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false
violationBrowserClose
setMetalFill -layer Metal1 -opcActiveSpacing 0.060 -borderSpacing -0.001 -opc
setMetalFill -layer Metal2 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal3 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal4 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal5 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal6 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal7 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal8 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal9 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal10 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
setMetalFill -layer Metal11 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
addMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 }
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
setAnalysisMode -cppr none -clockGatingCheck true -timeBorrowing true -useOutputPinCap true -sequentialConstProp false -timingSelfLoopsNoSkew false -enableMultipleDriveNet true -clkSrcPath true -warn true -usefulSkew true -analysisType onChipVariation -log true
setExtractRCMode -engine postRoute -effortLevel high -coupled true -capFilterMode relAndCoup -coupling_c_th 0.1 -total_c_th 0 -relative_c_th 1
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
setDelayCalMode -engine default -siAware true
optDesign -postRoute
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postRoute
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
setDelayCalMode -engine default -siAware true
optDesign -postRoute -hold
trimMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11 }
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
getFillerMode -quiet
addFiller -cell FILL1LVT FILL8LVT FILL64LVT FILL4LVT FILL32LVT FILL2LVT FILL16LVT -prefix FILLER
setMetalFill -layer Metal1 -opcActiveSpacing 0.060 -borderSpacing -0.001 -opc
setMetalFill -layer Metal2 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal3 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal4 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal5 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal6 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal7 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal8 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal9 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal10 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
setMetalFill -layer Metal11 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
addMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11 }
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
setMetalFill -layer Metal1 -opcActiveSpacing 0.060 -borderSpacing -0.001 -opc
setMetalFill -layer Metal2 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal3 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal4 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal5 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal6 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal7 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal8 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal9 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal10 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
setMetalFill -layer Metal11 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
addMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11 }
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
setMetalFill -layer Metal1 -opcActiveSpacing 0.060 -borderSpacing -0.001 -opc
setMetalFill -layer Metal2 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal3 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal4 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal5 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal6 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal7 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal8 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal9 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal10 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
setMetalFill -layer Metal11 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
addMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11 }
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
setMetalFill -layer Metal1 -opcActiveSpacing 0.060 -borderSpacing -0.001 -opc
setMetalFill -layer Metal2 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal3 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal4 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal5 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal6 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal7 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal8 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal9 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal10 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
setMetalFill -layer Metal11 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
addMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11 }
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
setMetalFill -layer Metal1 -opcActiveSpacing 0.060 -borderSpacing -0.001
setMetalFill -layer Metal2 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal3 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal4 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal5 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal6 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal7 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal8 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal9 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal10 -opcActiveSpacing 0.200 -borderSpacing -0.001
setMetalFill -layer Metal11 -opcActiveSpacing 0.200 -borderSpacing -0.001
addMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11 }
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
deleteMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11 }
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false
violationBrowserClose
setMetalFill -layer Metal1 -opcActiveSpacing 0.060 -borderSpacing -0.001
setMetalFill -layer Metal2 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal3 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal4 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal5 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal6 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal7 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal8 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal9 -opcActiveSpacing 0.070 -borderSpacing -0.001
setMetalFill -layer Metal10 -opcActiveSpacing 0.200 -borderSpacing -0.001
setMetalFill -layer Metal11 -opcActiveSpacing 0.200 -borderSpacing -0.001
addMetalFill -layer { Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11 }
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
setMetalFill -layer Metal1 -opcActiveSpacing 0.060 -borderSpacing -0.001 -opc
setMetalFill -layer Metal2 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal3 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal4 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal5 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal6 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal7 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal8 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal9 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal10 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
setMetalFill -layer Metal11 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false
violationBrowserClose
getCTSMode -engine -quiet
setMetalFill -layer Metal1 -opcActiveSpacing 0.060 -borderSpacing -0.001 -opc
setMetalFill -layer Metal2 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal3 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal4 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal5 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal6 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal7 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal8 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal9 -opcActiveSpacing 0.070 -borderSpacing -0.001 -opc
setMetalFill -layer Metal10 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
setMetalFill -layer Metal11 -opcActiveSpacing 0.200 -borderSpacing -0.001 -opc
getCTSMode -engine -quiet
addMetalFill -layer { Metal2 }
zoomBox 10690.622 3452.122 -5100.780 -3035.818
zoomBox -1791.327 -1191.216 2498.704 1627.948
zoomBox 1044.645 859.374 -498.213 -555.837
zoomBox 707.332 709.633 -81.062 -56.806
setMetalFill -layer Metal1 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal2 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal3 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal4 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal5 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal6 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal7 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal8 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal9 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal10 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
setMetalFill -layer Metal11 -windowSize 120.000 120.000 -windowStep 60.000 60.000 -minDensity 20.000 -maxDensity 65.000
verifyMetalDensity -report top.density.rpt
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verifyConnectivity -type all -error 1000 -warning 50
verifyProcessAntenna -report top.antenna.rpt -error 1000
saveNetlist ../netlist/pic16f84a_layout.v
writeTimingCon -sdc ../timing/postlayout.sdc
reset_parasitics
extractRC
rcOut -spef ../timing/pic.spef -rc_corner rc_basic
reset_parasitics
extractRC
rcOut -spef ../timing/pic.spef -rc_corner rc_basic
