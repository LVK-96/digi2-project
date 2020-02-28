### Repository structure:

- __simulations:__ directory for all simulaiton-related files, namely
    - do-files: QuestaSim scripts for automatic compiling of VHDL code and
      running simulation 
    - (optional) input and output files: these are sometimes required for
      your testbench for reading and writing information using VHDL textio 
    - QuestaSim files: these are automatically generated and should not be
      included in git version control (see .gitignore file)
- __vhdl:__ directory for your VHDL code and testbenches. _Remember, only 1 entity per file!_


### Running simulations

```
cd simulations
use advms_17.1
vsim -do run_simulation.do
```
