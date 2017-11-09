#!/usr/bin/env bash

USER="$( whoami )"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOST="$( hostname )"
echo $USER
echo $DIR
echo $HOST

function_to_fork() {
  top -b -n 60 -d 60 -u $USER > $SLURM_JOBID.$HOST.$$.top
}
function_to_fork &

export OMP_NUM_THREADS=136
export KMP_BLOCKTIME=30
export KMP_SETTINGS=1
export KMP_AFFINITY="granularity=fine,verbose,compact,1,0"


python $DIR/keras_mnist.py
