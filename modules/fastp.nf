process FASTP {

    tag "$sample_id"

    publishDir "results/fastp", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("${sample_id}_trimmed.fastq.gz")

    script:
    """
    fastp \
        -i ${reads} \
        -o trimmed.fastq

    gzip trimmed.fastq

    mv trimmed.fastq.gz ${sample_id}_trimmed.fastq.gz
    """
}