# AWS RNA-seq Workflow Engineering Documentation

## Objective

Build a scalable RNA-seq analysis workflow on AWS using containerized bioinformatics tools and workflow orchestration.

---

# AWS Services Used

## EC2

Used as cloud compute infrastructure for workflow execution.

Instance type used:

* t3.micro
* later upgraded to t3.medium for STAR indexing memory requirements

Region:

* ap-south-1 (Mumbai)

---

## IAM Role

Role:

* rnaseq-ec2-s3-role

Purpose:

* secure S3 access without storing AWS credentials

---

## S3 Bucket

Bucket:

* prac-rnaseq-workflow

Used for:

* results storage
* workflow backup
* log archival

---

# Workflow Technologies

* Nextflow
* Docker
* STAR
* FastQC
* fastp
* featureCounts

---

# Workflow Steps

1. FASTQC_RAW
2. FASTP
3. FASTQC_TRIMMED
4. STAR_ALIGN
5. FEATURECOUNTS

---

# Major Engineering Challenges Solved

## 1. Docker Filesystem Isolation

Issue:

* STAR index inaccessible inside container

Solution:

* Nextflow path staging using input channels

---

## 2. STAR Genome Index Errors

Issue:

* missing genomeParameters.txt

Solution:

* proper STAR genome generation
* correct mounting strategy

---

## 3. Memory Constraints

Issue:

* STAR genome generation failed on t3.micro

Solution:

* upgraded EC2 instance to t3.medium

---

## 4. Workflow Orchestration

Implemented:

* modular Nextflow processes
* reusable workflow architecture
* containerized execution

---

# Cloud Architecture

Laptop
↓
SSH
↓
AWS EC2
↓
Docker Containers
↓
Nextflow Workflow
↓
RNA-seq Analysis
↓
AWS S3 Storage

---

# Results

Successfully executed:

* QC
* trimming
* alignment
* quantification

Outputs stored in:

* local results directory
* AWS S3 bucket

---

# Skills Demonstrated

* AWS EC2
* AWS IAM
* AWS S3
* Linux
* Docker
* Nextflow
* Bioinformatics workflow engineering
* RNA-seq analysis
* Cloud debugging
* Container orchestration

---

# Future Improvements

* AWS Batch integration
* autoscaling compute
* multi-sample execution
* CloudWatch monitoring
* CI/CD integration
