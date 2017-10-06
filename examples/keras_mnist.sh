#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

function_to_fork() {
  top -b -n 60 -d 60 -u brettin > $COBALT_JOBID.$$.top
}
function_to_fork &


python $DIR/keras_mnist.py
