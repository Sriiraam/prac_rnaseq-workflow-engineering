process FEATURECOUNTS {

    tag "$sample_id"

    publishDir "results/counts", mode: 'copy'

    input:
    tuple val(sample_id), path(bam)
    path gtf

    output:
    path "*.txt"

    script:
    """
    featureCounts \
        -a ${gtf} \
        -o counts.txt \
        ${bam}
    """
}