#!/bin/bash
#SBATCH --job-name=rydberg
#SBATCH --output=logs/job_%A_%a.out
#SBATCH --error=logs/job_%A_%a.err

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=test
#SBATCH --cpus-per-task=30
#SBATCH --mem=990GB
#SBATCH --time=1:35:00

export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1

module purge
module load python

source activate rydcalc


cp -r /n/netscratch/giuliasemeghini_lab/Lab/yizhu/cached_matrix_elements /scratch/cached_matrix_elements
python Yb_Rb_search.py
cp -r /scratch/cached_matrix_elements /n/netscratch/giuliasemeghini_lab/Lab/yizhu/cached_matrix_elements
