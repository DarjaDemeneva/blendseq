#!/bin/bash

#=============================================================================
# DRAGMAP Alignment Script for Paired-End FASTQ to BAM
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 15.07.2025
#=============================================================================

# CONFIGURATION VARIABLES - MODIFY THESE PATHS
#=============================================================================
# Reference genome hash table directory (must be built with dragen --build-hash-table)
REF_DIR="/home/darja/nas1/blendseq/data/align/align-ilmn/hash-table"

# Input FASTQ files (paired-end)
FASTQ_R1="/home/darja/nas1/blendseq/data/raw-sequence-files/reads-ilmn/SRR32255563_blend-seq_ILMN_NVX_Reads_1.fastq.gz"
FASTQ_R2="/home/darja/nas1/blendseq/data/raw-sequence-files/reads-ilmn/SRR32255563_blend-seq_ILMN_NVX_Reads_2.fastq.gz"

# Output configuration
OUTPUT_DIR="/home/darja/nas1/blendseq/data/align/align-ilmn/results"
OUTPUT_PREFIX="SRR32255563"

# Read group information (required for downstream GATK analysis)
RGID="sample_flowcell_lane"         # Read group ID (e.g., "H0164.2")
RGSM="HG002"                        # Sample name

# Processing options
THREADS=16                            # Number of threads to use

#=============================================================================
# SCRIPT EXECUTION
#=============================================================================

# Create output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Check if required files exist
if [[ ! -d "${REF_DIR}" ]]; then
    echo "Error: Reference directory not found: ${REF_DIR}"
    exit 1
fi

if [[ ! -f "${FASTQ_R1}" ]]; then
    echo "Error: FASTQ R1 file not found: ${FASTQ_R1}"
    exit 1
fi

if [[ ! -f "${FASTQ_R2}" ]]; then
    echo "Error: FASTQ R2 file not found: ${FASTQ_R2}"
    exit 1
fi

# Display configuration
echo "==============================================================================" 
echo "DRAGMAP Alignment Configuration:"
echo "Reference Directory: ${REF_DIR}"
echo "Input R1: ${FASTQ_R1}"
echo "Input R2: ${FASTQ_R2}"
echo "Output Directory: ${OUTPUT_DIR}"
echo "Output Prefix: ${OUTPUT_PREFIX}"
echo "Sample Name: ${RGSM}"
echo "Threads: ${THREADS}"
echo "=============================================================================="

# Run DRAGMAP alignment
echo "Starting DRAGMAP alignment..."
echo "Command: dragen -r ${REF_DIR} ..."

dragen-os -r "${REF_DIR}" \
    -1 "${FASTQ_R1}" \
    -2 "${FASTQ_R2}" \
    --output-directory "${OUTPUT_DIR}" \
    --output-file-prefix "${OUTPUT_PREFIX}" \
    --RGID "${RGID}" \
    --RGSM "${RGSM}" \
    --num-threads "${THREADS}" \


# Check if alignment completed successfully
if [[ $? -eq 0 ]]; then
    echo "=============================================================================="
    echo "DRAGMAP alignment completed successfully!"
    echo "Output files:"
    echo "  - BAM file: ${OUTPUT_DIR}/${OUTPUT_PREFIX}.bam"
    echo "  - Alignment metrics: ${OUTPUT_DIR}/${OUTPUT_PREFIX}.mapping_metrics.csv"
    echo "=============================================================================="
else
    echo "Error: DRAGMAP alignment failed with exit code $?"
    exit 1
fi

# Optional: Display basic alignment statistics - put into a separate file `align-stats.sh`
echo "Alignment Statistics:"
echo "=============================================================================="
if command -v samtools &> /dev/null; then
    echo "Total reads aligned:"
    samtools view -c "${OUTPUT_DIR}/${OUTPUT_PREFIX}.bam"
    echo "Alignment rate:"
    samtools flagstat "${OUTPUT_DIR}/${OUTPUT_PREFIX}.bam"
else
    echo "Install samtools to view alignment statistics"
fi

echo "Script completed successfully!"
