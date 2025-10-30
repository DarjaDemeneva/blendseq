#!/bin/bash

#=============================================================================
# Picard FastqToSam script for converting simulated Illumina paired-end FASTQ reads into unmapped BAM (uBAM) fo GATK Whole Genome Germline Single Sample pipeline
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 05.08.2025
#=============================================================================


# Declare input FASTQ file variables
FASTQ1="/home/darja/nas1/blendseq/warp-pipelines/data/warp-gatk-dragen-input-files-01/synthetic-input-reads/simulated1.fq"
FASTQ2="/home/darja/nas1/blendseq/warp-pipelines/data/warp-gatk-dragen-input-files-01/synthetic-input-reads/simulated2.fq"

# Declare output BAM file and sample metadata
OUTPUT_BAM="/home/darja/nas1/blendseq/warp-pipelines/data/warp-gatk-dragen-input-files-01/synthetic-input-reads/synthetic_ILMN.unmapped.bam"
READ_GROUP_NAME="HG002_ilmn"
SAMPLE_NAME="HG002"
LIBRARY_NAME="LB01"
PLATFORM="illumina"
SEQUENCING_CENTER="BROAD_INSTITUTE"
# adding the referenece sequence variable to hopefully have the @SQ in the bam file header - not used - can remove or leave for my own reference - no effect on output file 
REFERENCE="/home/darja/nas1/blendseq/warp-pipelines/data/warp-gatk-dragen-input-files-01/reference-and-index/Homo_sapiens_assembly38.fasta"

# Run Picard FastqToSam
picard FastqToSam \
    FASTQ=$FASTQ1 \
    FASTQ2=$FASTQ2 \
    OUTPUT=$OUTPUT_BAM \
    READ_GROUP_NAME=$READ_GROUP_NAME \
    SAMPLE_NAME=$SAMPLE_NAME \
    LIBRARY_NAME=$LIBRARY_NAME \
    PLATFORM=$PLATFORM \
    SEQUENCING_CENTER=$SEQUENCING_CENTER \
    REFERENCE_SEQUENCE=$REFERENCE \