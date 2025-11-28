#!/bin/bash

#=============================================================================
# QC of ILMN paired end reads alignment for HG002 sample (used for blend-seq experiment); aligned with DRAGMAP using Hg38 as reference from Broad AWS
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 22.07.2025
#=============================================================================

# Declare input FASTQ file variables
SAM="/home/darja/nas-lasr/blendseq/data/align/align-ilmn/results/SRR32255563.sam"


# Declare output report directory 
OUTPUT_DIR="/home/darja/nas-lasr/blendseq/data/align/align-ilmn/results"

# Number of CPU threads to use 
THREADS=16

# Run FastC on both reads
fastqc -t $THREADS -o "$OUTPUT_DIR" "$SAM"

# Optional: Print status message
echo "FastQC analysis complete. Results written to $OUTPUT_DIR"
