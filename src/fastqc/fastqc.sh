#!/bin/bash

#=============================================================================
# QC of ILMN paired end reads for HG002 sample (used for blend-seq experiment)
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 22.07.2025
#=============================================================================

# Declare input FASTQ file variables
FASTQ1="/home/darja/nas1/blendseq/data/raw-sequence-files/reads-ilmn/SRR32255563_blend-seq_ILMN_NVX_Reads_1.fastq.gz"
FASTQ2="/home/darja/nas1/blendseq/data/raw-sequence-files/reads-ilmn/SRR32255563_blend-seq_ILMN_NVX_Reads_2.fastq.gz"

# Declare output report directory 
OUTPUT_DIR="/home/darja/nas1/blendseq/data/fastqc-reports"

# Number of CPU threads to use 
THREADS=16

# Run FastC on both reads
fastqc -t $THREADS -o "$OUTPUT_DIR" "$FASTQ1" "$FASTQ2"  

# Optional: Print status message
echo "FastQC analysis complete. Results written to $OUTPUT_DIR"