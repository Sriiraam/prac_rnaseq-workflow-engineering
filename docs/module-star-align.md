# STAR Alignment Module

## Objective

Align trimmed RNA-seq reads against reference genome.

---

## Tool

STAR

---

## Input

Trimmed FASTQ (.fastq.gz)

---

## Reference

Mock genome FASTA

STAR genome index

---

## Output

Sorted BAM file

Example:

TEST_01_R1_Aligned.sortedByCoord.out.bam

---

## Workflow Position

FASTQ
→ FastQC
→ fastp
→ STAR Alignment
→ BAM

---

## Validation

PASS

STAR alignment completed successfully.

BAM file generated successfully.

---

## Engineering Notes

- STAR index passed through Nextflow channel
- Modular DSL2 design implemented
- Alignment output published to results/alignment