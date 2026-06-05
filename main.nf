nextflow.enable.dsl=2

include { FASTQC as FASTQC_RAW } from './modules/fastqc'
include { FASTQC as FASTQC_TRIMMED } from './modules/fastqc'
include { FASTP } from './modules/fastp'

workflow {

    Channel
        .fromPath("data/test/*.fastq.gz")
        .map { file ->
            tuple(file.simpleName.replace('.fastq',''), file)
        }
        .set { reads_ch }

    /*
     * RAW FASTQC
     */
    FASTQC_RAW(reads_ch)

    /*
     * FASTP TRIMMING
     */
    trimmed_ch = FASTP(reads_ch)

    /*
     * TRIMMED FASTQC
     */
    FASTQC_TRIMMED(trimmed_ch)
}