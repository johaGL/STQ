#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --job-name=stqJoha
#SBATCH --output=/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/slurmout/stq_%j.out
#SBATCH --workdir=/mnt/cbib/thesis_gbm/spatial_thesis/map-xenograft-ST/
#SBATCH --mail-user=juana7@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --mem=56G
#SBATCH -t 2-00:00:00


#####
# INDEX: only run once as same index is valid for all mappings
#   Note: launched from above STQ -->  sbatch STQ/index_run_once.sh
#####

scontrol show job $SLURM_JOB_ID

module load xenome

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
--workflow="deconvolution_indices" \
--bind="-B $binddir"
