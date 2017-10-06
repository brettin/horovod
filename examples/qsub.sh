#!/bin/bash
#COBALT -n 8
#COBALT -q default
#COBALT -A Candle_ECP
#COBALT -t 1:00:00

CONDA_ENV=tf-1.3.0_eigen_hv-0.9.6

source activate $CONDA_ENV

# -d <depth> specifices num CPUS (cores) per processing element.
# -j <num> specifies num CPUS (cores) per compute unit.
# -n <num> specifies num processing elements needed by the application
# -N <num> specifies num processing elements per node.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

aprun -n 8 -N 1 -d 256 -j 4 -cc depth -e KMP_SETTINGS=1 -e KMP_BLOCKTIME=30 -e KMP_AFFINITY=granularity=fine,verbose,compact,1,0 -e OMP_NUM_THREADS=144 -b $DIR/keras_mnist.sh

source deactivate
