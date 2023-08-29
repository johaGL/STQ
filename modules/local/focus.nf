
process CHECK_FOCUS {

    tag "$sample_id"
    label 'process_focus'
    maxRetries 3
    errorStrategy  { task.attempt <= maxRetries  ? 'retry' : 'finish' }
    memory { 6.GB + (Float.valueOf(size) / 1000.0).round(2) * params.memory_scale_factor * 1.GB }
    publishDir "${params.outdir}/${sample_id}/focus", pattern: 'output/*', saveAs: { "${file(it).getFileName()}" }, mode: 'copy', overwrite: true
    
    input:
    tuple val(sample_id), path(image), val(size)
    
    output:
    tuple val(sample_id), file("output/*")

    script:    
    """
    [ ! -d "output" ] && mkdir "output"
    
    python3 /deepfocus/runDeepFocus.py --checkpoint-dir=/deepfocus/ --wsi-file="${image}" --output-dir="output/"
    """
}
