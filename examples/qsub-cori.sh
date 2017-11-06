#!/bin/bash

#SBATCH -p debug

#SBATCH --time=02:00:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --workdir=/global/u1/b/brettin/Supervisor/workflows/nt3_mlrMBO/experiments/run3

#SBATCH --constraint=knl,quad,cache
#SBATCH --license=SCRATCH
#SBATCH --account=m2759




set -x

CONDA_ENV=tf-1.3.0_eigen_hv-0.9.6

source activate $CONDA_ENV


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

srun $DIR/keras_mnist_cori.sh

source deactivate
