#!/usr/bin/env bash

HOST="$( hostname )"
USER="$( whoami )"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $HOST
echo $USER
echo $DIR

top -b -n 60 -d 60 -u $USER > $COBALT_JOBID.$HOST.$$.top &
cpid=$!

export OMP_NUM_THREADS=136
export KMP_BLOCKTIME=30
export KMP_SETTINGS=1
export KMP_AFFINITY="granularity=fine,verbose,compact,1,0"


python $DIR/keras_mnist.py
kill -9 $cpid

