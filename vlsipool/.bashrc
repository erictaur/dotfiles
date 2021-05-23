########################################
#            PATH EXPORTS              #
########################################

#########################
###    BASE EXPORTS   ###
#########################

# Export EECSTOKENS
export PATH="/usr/vlsipool/bin:\
            /usr/vlsipool/anaconda2/bin:\
            /usr/um/bin:/usr/caen/bin:\
            /usr/local/bin:\
            /usr/bin:\
            /usr/sbin:\
            /bin:\
            /sbin:\
            /usr/local/bin:\
            /usr/bin:\
            /usr/local/sbin:\
            /usr/sbin:$PATH"

# Export afs home
export GOOGLE="/afs/eecs.umich.edu/vlsida/projects/restricted/google"

# Export afs home
export AFS_HOME="$GOOGLE/khtaur"

# Macros/Design file locations
export PLATFORM="$GOOGLE/platforms"

#########################
### REPO ROOT EXPORTS ###
#########################

# Export Azadi simulation paths
export PATH="$GOOGLE/software/verilator-general/bin/:$PATH"
export PATH="$GOOGLE/wenbo/elf2hex/build/bin/:$PATH"
export PATH="/afs/eecs.umich.edu/cadre/software/riscvimc-2018-08-13/bin/:$PATH"
export AZADI_ROOT="$AFS_HOME/azadi"

# Export IBEX simulation paths
export IBEX_COLLAB="$AFS_HOME/ibex_collab"

# Export OPENTITAN paths
export OPENTITAN_ROOT="$AFS_HOME/opentitan_soc"

# Export GF12 paths
export OPENTITAN_GF12_ROOT="$AFS_HOME/gf12_opentitan/opentitan_soc"

# Export CHAMELEON paths
export CHAMELEON_ROOT="$AFS_HOME/Chameleon_SoC"
export PATH="/afs/eecs.umich.edu/cadre/software/riscv64-gcc-8.1.0-2019.01.0/bin/:$PATH"

# Export OpenROAD paths
export OPENROAD_ROOT="$AFS_HOME/OpenROAD-flow-scripts"

#########################
### WORKFLOW  EXPORTS ###
#########################

# For working with APR
export SYNTH_ROOT="$AFS_HOME/fasoc_opentitan_synth"
export SYNTH_PROJECT="$SYNTH_ROOT/private/tests/fasoc_to_gf12_2021/fasoc_soc/opentitan_soc"
export OPENROAD_APR="$OPENROAD_ROOT/flow"

# DC Synthesized netlist file location
export SYNTH_SCRIPT="$SYNTH_ROOT/private/tests/fasoc_to_gf12_2021/scripts/dc"
export SYNTH_NLIST="$SYNTH_ROOT/private/tests/fasoc_to_gf12_2021/results/dc"

# Source OpenROAD environment script
source $GOOGLE/mehdi/Eder-fix/OpenROAD-flow-scripts/setup_env.sh
export spdlog_ROOT="$GOOGLE/tools/install/n/holly/v/mehdi/google/tools"
# source $AFS_HOME/OpenROAD-flow-scripts/setup_env.sh

# Directory to paste 1_synth.v and 1_synth.sdc
mkdir -p $OPENROAD_ROOT/flow/results/gf12/opentitan_soc/base
export OPENROAD_BASE="$OPENROAD_ROOT/flow/results/gf12/opentitan_soc/base"


# Calibre Path and exports
export TECHDIR_DRC=/afs/eecs.umich.edu/kits/GF/12LP/V1.0_2.1/DRC/Calibre
export TECHDIR_LVS=/afs/eecs.umich.edu/kits/GF/12LP/tapo_V1.0_3.1/LVS/Calibre
export BEOL_STACK=13M_3Mx_2Cx_4Kx_2Hx_2Gx_LB
export DESIGN_TYPE=CELL
export CHIP_DIE_COUNT=1CHIP_SHOT
export IOTYPE=INLINE_50
export C_ORIENTATION=VERTICAL
export LAYOUT_SYSTEM=GDSII
export CELL_BOUNDARY=OUTLINE
export CELL_SS=10
export CELL_FINE_SS=YES
export DP_CHECK_DESIGN_ALL=YES
export DP_GENERATION_TOOL_ALL=YES
export DP_AUTO_STITCH_ALL=YES
export DP_LAYOUT_OUT=GDSII

########################################
#            MODULE EXPORTS            #
########################################

# Source to use module command
if [ -f /etc/profile.d/modules.sh ]; then
    source /etc/profile.d/modules.sh
    echo "Module Command Sourced!"
fi


# Module directory locations
module use /afs/eecs.umich.edu/cadre/software/modules
module use /afs/eecs.umich.edu/cadre/software/openroad/modules


# Load VS Code
module load vscode-el7

# Load Common Dependencies (OpenROAD/Yosys)
module load devtoolset
module load anaconda3
module load cmake/3.14.0
module load zlib/1.2.7
module load boost
module load swig/4.0.0
module load tcl-devel

# Load OpenROAD Dependencies
module load lemon/1.3.1
module load eigen/3.3.7
module load tcl-tclreadline/2.1.0

# Load Yosys Dependencies
module load bison
module load libffi-devel
module load readline-devel

# Load Synthesis Dependencies
module load synopsys-lib-compiler/2018.06
module load synopsys-synth/2019.12-SP4

# Load APR Dependencies
module load anaconda3
module load klayout

# Load iVerilog Dependencies
module load iverilog

# Load Calibre
module load calibre/2019.3_25

# Load Innovus
module load innovus

# Load PrimeTime
module load primetime/2017.06

########################################
#          SHELL DEFINITIONS           #
########################################

# import setting files
#if [ -f ~/Setting/.bash_colors ]; then
#    . ~/Setting/.bash_colors
#fi
# Alias definitions
#if [ -f ~/Setting/.bash_aliases ]; then
#    . ~/Setting/.bash_aliases
#fi
# Functions definitions
#if [ -f ~/Setting/.bash_functions ]; then
#    . ~/Setting/.bash_functions
#fi
