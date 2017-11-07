#!/usr/bin/env bash
#SBATCH -N 2
#SBATCH -p debug
#SBATCH -C knl,quad,cache
#SBATCH -t 30:00
#SBATCH -L SCRATCH

module load python/2.7-anaconda
module load darshan

export LD_LIBRARY_PATH=/usr/common/software/darshan/3.1.4/lib:$LD_LIBRARY_PATH
source activate horovod-tf2


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# DIR=/global/homes/b/brettin/hackathon1710/docs/horovod/examples
echo $DIR

export OMP_NUM_THREADS=136
export KMP_BLOCKTIME=30
export KMP_SETTINGS=1
export KMP_AFFINITY="granularity=fine,verbose,compact,1,0"

srun $DIR/keras_mnist_cori.sh

source deactivate
