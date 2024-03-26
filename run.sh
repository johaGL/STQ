
workflow="arbitrary_grid" ### "two_references" "one_reference" "arbitrary_grid" "deconvolution_indices"
#samplesheet="./assets/samplesheet_test_sj.csv"
samplesheet="./assets/samplesheet_test_sj_short.csv"
#samplesheet="../samplesheet_pilot_stjudes_aoi.csv"
workdir="./work-short"
outdir="./results"
binddir="/projects/"

#----------------------------------------------------------------------------------------------------

SLURM_SUBMIT_DIR=`pwd`

#sbatch \
submit.sb $workflow "$samplesheet" "$workdir" "$outdir" "$binddir"                                                          