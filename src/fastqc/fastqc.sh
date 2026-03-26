#!/bin/bash

#=============================================================================
# QC of ILMN paired end reads for HG002 sample (used for blend-seq experiment)
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 22.07.2025
#=============================================================================

# Declare input FASTQ file variables
FASTQ1="/mnt/nas1/projects/lasr/Illumina_Pipline/Data/ERR3684866_1.fastq.gz"
FASTQ2="/mnt/nas1/projects/lasr/Illumina_Pipline/Data/ERR3684866_2.fastq.gz"

# Declare output report directory 
OUTPUT_DIR="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/fastqc_reports/ERR3684866_HG002"

# Number of CPU threads to use 
THREADS=16

# Run FastC on both reads
fastqc -t $THREADS -o "$OUTPUT_DIR" "$FASTQ1" "$FASTQ2"  

# Optional: Print status message
echo "FastQC analysis complete. Results written to $OUTPUT_DIR"