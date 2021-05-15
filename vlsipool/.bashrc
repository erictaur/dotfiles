########################################
#            PATH EXPORTS              #
########################################

# Export EECSTOKENS
export PATH="/usr/vlsipool/bin:/usr/vlsipool/anaconda2/bin:/usr/um/bin:/usr/caen/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:$PATH"

# Export Azadi simulation paths
export PATH="/afs/eecs.umich.edu/vlsida/projects/restricted/google/software/verilator-general/bin/:$PATH"
export PATH="/afs/eecs.umich.edu/vlsida/projects/restricted/google/wenbo/elf2hex/build/bin/:$PATH"
export PATH="/afs/eecs.umich.edu/cadre/software/riscvimc-2018-08-13/bin/:$PATH"
export AZADI_ROOT="/afs/eecs.umich.edu/vlsida/projects/restricted/google/khtaur/azadi"

# Export IBEX simulation paths
export IBEX_COLLAB="/afs/eecs.umich.edu/vlsida/projects/restricted/google/khtaur/ibex_collab"

# Export OPENTITAN paths
export OPENTITAN_ROOT="/afs/eecs.umich.edu/vlsida/projects/restricted/google/khtaur/opentitan_soc"

# Export GF12 paths
# export OPENTITAN_GF12_ROOT="/afs/eecs.umich.edu/vlsida/projects/restricted/google/naomikmo/gf12_opentitan/opentitan_soc"
export OPENTITAN_GF12_ROOT="/afs/eecs.umich.edu/vlsida/projects/restricted/google/khtaur/gf12_opentitan/opentitan_soc"

# Export CHAMELEON paths
export CHAMELEON_ROOT="/afs/eecs.umich.edu/vlsida/projects/restricted/google/khtaur/Chameleon_SoC"
export PATH="/afs/eecs.umich.edu/cadre/software/riscv64-gcc-8.1.0-2019.01.0/bin/:$PATH"

# Export afs home
export AFS_HOME="/afs/eecs.umich.edu/vlsida/projects/restricted/google/khtaur"

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
