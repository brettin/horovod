
#!/usr/bin/env bash

function_to_fork() {
  top -b -n 60 -d 60 -u brettin > $COBALT_JOBID.$$.top
}
function_to_fork &

python keras_minst.py
