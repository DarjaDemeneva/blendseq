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

# FASTQ1="/mnt/nas1/projects/lasr/Illumina_Pipline/Data/ERR3684866_1.fastq.gz"
# FASTQ2="/mnt/nas1/projects/lasr/Illumina_Pipline/Data/ERR3684866_2.fastq.gz"

# Declare output BAM file and sample metadata
OUTPUT_BAM="/home/darja/nas1/blendseq/data/unaligned-bam/sorted-SRR32255563_ILMN.unmapped.bam"
READ_GROUP_NAME="HG002_ilmn"
SAMPLE_NAME="HG002"
LIBRARY_NAME="LB01"
PLATFORM="illumina"
SEQUENCING_CENTER="BROAD_INSTITUTE"

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
    SORT_ORDER="queryname"