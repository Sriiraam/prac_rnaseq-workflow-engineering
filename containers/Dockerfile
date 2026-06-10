FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    fastqc \
    fastp \
    rna-star \
    subread \
    default-jre \
    wget

WORKDIR /workspace