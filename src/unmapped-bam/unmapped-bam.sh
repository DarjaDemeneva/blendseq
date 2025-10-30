#!/bin/bash

#=============================================================================
# Picard FastqToSam script for converting raw Illumina paired-end FASTQ reads inot unmapped BAM (uBAM) fo GATK Whole Genome Germline Single Sample pipeline
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 22.07.2025
#=============================================================================


# Declare input FASTQ file variables
FASTQ1="/home/darja/nas1/blendseq/data/raw-sequence-files/reads-ilmn/SRR32255563_blend-seq_ILMN_NVX_Reads_1.fastq.gz"
FASTQ2="/home/darja/nas1/blendseq/data/raw-sequence-files/reads-ilmn/SRR32255563_blend-seq_ILMN_NVX_Reads_2.fastq.gz"

# Declare output BAM file and sample metadata
OUTPUT_BAM="/home/darja/nas1/blendseq/data/unaligned-bam/SRR32255563_blend_seq_ILMN.unmapped.bam"
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