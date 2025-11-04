#!/bin/bash

#=============================================================================
# Picard MarkIlluminaAdapters script for tagging Illumina paired-end FASTQ reads in the unmapped BAM (uBAM) with the tags containing the adapter sequences in the XT:Z tag for GATK Whole Genome Germline Single Sample pipeline
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 04.08.2025
#=============================================================================

conda activate ubam 

picard MarkIlluminaAdapters \
    I=/home/darja/nas1/blendseq/data/unaligned-bam/2-SRR32255563_blend_seq_ILMN.unmapped.bam \
    O=/home/darja/nas1/blendseq/data/unaligned-bam/SRR32255563_blend_seq_ILMN.unmapped.bam \
    M=/home/darja/nas1/blendseq/data/unaligned-bam/marked_adapters_metrics.txt

# This tool scans for known adapter sequences and adds information (`XT:Z:Adapter as a tag`) in the BAM file  
# Donwstream tools that recognise the XT tag can use this information for masking or clipping during alignment  
# Resulting output: reads with adapter sequences have an XT tag added to them