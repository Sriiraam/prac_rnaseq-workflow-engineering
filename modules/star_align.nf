process STAR_ALIGN {

    tag "$sample_id"

    publishDir "results/alignment", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)
    path genome_index

    output:
    tuple val(sample_id), path("${sample_id}_Aligned.sortedByCoord.out.bam")

    script:
    """
    STAR \
        --runThreadN 2 \
        --genomeDir ${genome_index} \
        --readFilesIn ${reads} \
        --readFilesCommand zcat \
        --outSAMtype BAM SortedByCoordinate \
        --outFileNamePrefix ${sample_id}_
    """
}