#!/bin/bash

#SBATCH --nodes=1
#SBATCH --mem=180G
#SBATCH -t 5-40:00:00
#SBATCH --ntasks-per-node=4
#SBATCH --job-name=stqJoha
#SBATCH --output=/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/slurmout/stq_%j.out
#SBATCH --workdir=/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/
#SBATCH --mail-user=juana7@gmail.com
#SBATCH --mail-type=ALL



scontrol show job $SLURM_JOB_ID


workdir="/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST"
samplesheet="/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/demodata/samplesheet_demo_local.csv"
outdir="/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/results"
binddir="/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/mybinddir"


nextflow run STQ/main.nf \
-w $workdir \
-profile slurm,singularity \
-resume \
--input=$samplesheet \
--outdir=$outdir \
--workflow="two-references" \
--bind="-B $binddir"