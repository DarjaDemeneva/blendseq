#!/bin/bash

#=============================================================================
# Samtools script for displaying basic alignmnet statistics
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 16.07.2025
#=============================================================================

# CONFIGURATION VARIABLES - MODIFY THESE PATHS
#=============================================================================

# Output configuration
OUTPUT_DIR="/home/darja/nas1/blendseq/data/align/align-ilmn/results"
OUTPUT_PREFIX="SRR32255563"
OUTPUT_EXT="sam" 

#=============================================================================
# SCRIPT EXECUTION
#=============================================================================

# Display basic alignment statistics
echo "Alignment Statistics:"
echo "=============================================================================="
if command -v samtools &> /dev/null; then
    echo "Total reads aligned:"
    samtools view -c "${OUTPUT_DIR}/${OUTPUT_PREFIX}.${OUTPUT_EXT}"
    echo "Alignment rate:"
    samtools flagstat "${OUTPUT_DIR}/${OUTPUT_PREFIX}.${OUTPUT_EXT}"
else
    echo "Install samtools to view alignment statistics"
fi

echo "Script completed successfully!"
