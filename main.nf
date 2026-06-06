nextflow.enable.dsl=2

include { FASTQC as FASTQC_RAW } from './modules/fastqc'
include { FASTQC as FASTQC_TRIMMED } from './modules/fastqc'
include { FASTP } from './modules/fastp'
include { STAR_ALIGN } from './modules/star_align'
include { FEATURECOUNTS } from './modules/featurecounts'

workflow {

    Channel
        .fromPath("data/test/*.fastq.gz")
        .map { file ->
            tuple(file.baseName.replace(".fastq",""), file)
        }
        .set { reads_ch }

    genome_index_ch = Channel.value(file("data/reference/star_index"))
    gtf_ch = Channel.fromPath("data/reference/genes.gtf")

    FASTQC_RAW(reads_ch)

    trimmed_ch = FASTP(reads_ch)

    FASTQC_TRIMMED(trimmed_ch)

    aligned_ch = STAR_ALIGN(trimmed_ch, genome_index_ch)

    FEATURECOUNTS(aligned_ch, gtf_ch)
}