#!/bin/bash
#COBALT -n 8 
#COBALT -q default
#COBALT -A Candle_ECP
#COBALT -t 1:00:00

set -e
set -x

CONDA_ENV=tf-1.3.0_eigen_hv-0.9.6
source activate $CONDA_ENV

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

aprun -N 1 -n 8 -b python $DIR/debug.py

source deactivate
