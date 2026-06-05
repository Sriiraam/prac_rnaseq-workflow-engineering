nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc'

workflow {

    Channel
        .fromPath("data/test/*.fastq.gz")
        .map { file ->
            tuple(file.baseName, file)
        }
        .set { reads_ch }

    FASTQC(reads_ch)
}