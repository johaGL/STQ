#!/bin/bash

#SBATCH --nodes=1
#SBATCH --mem=220G
#SBATCH -t 30-40:00:00
#SBATCH --ntasks-per-node=4
#SBATCH --job-name=stqJoha
#SBATCH --output=/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/slurmout/stq_%j.out
#SBATCH --workdir=/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/
#SBATCH --mail-user=juana7@gmail.com
#SBATCH --mail-type=ALL

## Note: launch from above STQ -->  sbatch STQ/demo_ranger.sh
##       always launch `module load nextflow` beforehand
##       (Metabo/stable module comes with: numpy, scipy, pd, scanpy)

scontrol show job $SLURM_JOB_ID

module load xenome
module load fastqtools/0.8.3
module load Metabo/stable


workdir="/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST"
samplesheet="/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/TD_FirstRound.csv"
outdir="/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/results"
binddir="/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/sing_bin"


nextflow run STQ/main.nf \
-w $workdir \
-profile slurm,singularity \
-resume \
--input=$samplesheet \
--outdir=$outdir \
--workflow="two_references" \
--bind="-B $binddir"
