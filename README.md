# Digital microelectronics II design project - PIC16F84A microcontroller

Implementation of the PIC16F84A microcontoller.

## Scripts

Run the scripts in order to complete the design flow.

### Simulation

```
cd simulations
use advms_17.1
vsim -do pic16f84a_simulation.do
```

### Synthesis

```
cd synthesis
use syn_2015.06-SP4
design_vision -f synthesis.tcl
```

### Verification

```
cd formality
use formality_2015.06-SP4
formality -f verify.tcl
```

### Place and route

```
cd layout
use innovus_18.1
innovus -file layout.tcl

```
Generated reports:
* `top.density.rpt`
* `top.antenna.rpt`
* `top.conn.rpt`
* `top.geom.rpt`
* `top.metalfill.rpt`

There might be some warnings in these reports. I ignored them, since
the digiflow tutorial states that some errors might appear and that
there is currently no solution for them.

### Final verification
```
cd formality
use formality_2015.06-SP4
formality -f verify_layout.tcl
```

```
cd primetime
mkdir reports
use primetime_2015.12
pt_shell -f timing_setup.tcl
pt_shell -f timing_hold.tcl
```

Generated reports:
* `reports/setup_check.rpt`
* `reports/setup_viol.rpt`
* `reports/setup_check.rpt`
* `reports/hold_check.rpt`
* `reports/hold_viol.rpt`
* `reports/hold_power.rpt`
