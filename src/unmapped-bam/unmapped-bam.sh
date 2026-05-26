#!/bin/bash

#=============================================================================
# Picard FastqToSam script for converting raw Illumina paired-end FASTQ reads into unmapped BAM (uBAM) fo GATK Whole Genome Germline Single Sample pipeline
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 22.07.2025
#=============================================================================


# Declare input FASTQ file variables
FASTQ1="/mnt/nas1/projects/lasr/Illumina_Pipline/Data/ERR3687419_1.fastq.gz"
FASTQ2="/mnt/nas1/projects/lasr/Illumina_Pipline/Data/ERR3687419_2.fastq.gz"

# Declare output BAM file and sample metadata
OUTPUT_BAM="/home/darja/nas1/blendseq/data/unaligned-bam/ERR3687419_ILMN.unmapped.bam"
READ_GROUP_NAME="HG005_ilmn"
SAMPLE_NAME="HG005"
LIBRARY_NAME="LB01"
PLATFORM="illumina"

# Run Picard FastqToSam
picard FastqToSam \
    FASTQ=$FASTQ1 \
    FASTQ2=$FASTQ2 \
    OUTPUT=$OUTPUT_BAM \
    READ_GROUP_NAME=$READ_GROUP_NAME \
    SAMPLE_NAME=$SAMPLE_NAME \
    LIBRARY_NAME=$LIBRARY_NAME \
    PLATFORM=$PLATFORM \
    SORT_ORDER="queryname"