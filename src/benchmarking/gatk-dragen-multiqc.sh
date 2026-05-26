#!/usr/bin/env bash

#=============================================================================
# Script for collecting all QC files from the Whole Genome Germline Single Sample pipeline for downstream MultiQC
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 26.5.2026
#=============================================================================

# create and activate environment with hap.py, rtg-tools  
conda create -n happy 
conda install bioconda::hap.py==0.3.15
conda install bioconda::rtg-tools==3.13
conda activate happy 

# handle errors safely 
set -euo pipefail

# set the default reference genome for happy to GRCh38 - use DRAGEN masked reference 
export HGREF=/mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/warp-gatk-dragen-input-files-01/dragmap-ref/Homo_sapiens_assembly38_masked.fasta

#=============================================================================

# download benchmarking files from GIAB for HG002 (v4.2.1)
ftp https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/AshkenazimTrio/HG002_NA24385_son/NISTv4.2.1/README_v4.2.1.txt
ftp https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/AshkenazimTrio/HG002_NA24385_son/NISTv4.2.1/GRCh38/HG002_GRCh38_1_22_v4.2.1_benchmark.vcf.gz
ftp https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/AshkenazimTrio/HG002_NA24385_son/NISTv4.2.1/GRCh38/HG002_GRCh38_1_22_v4.2.1_benchmark.vcf.gz.tbi
ftp https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/AshkenazimTrio/HG002_NA24385_son/NISTv4.2.1/GRCh38/HG002_GRCh38_1_22_v4.2.1_benchmark_noinconsistent.bed 

# Run hap.py with normalisation, left-shifting and conversion from gvcf for the query 
hap.py \
    /mnt/nas1/projects/lasr/blendseq/data/benchmarking/HG002/v4.2.1/HG002_GRCh38_1_22_v4.2.1_benchmark.vcf.gz \
    /mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/run-results/ERR3684866_ILMN_23/ERR3684866_ILMN_gvcf_run23.hard-filtered.rb.g.vcf.gz \
    --engine vcfeval \
    --gender male \
    --filter-nonref \
    --convert-gvcf-query \
    --bcftools-norm \
    -L \
    --logfile /mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/benchmarking-results/HG002/happy.log \
    -V \
    --verbose \
    -r $HGREF \
    -f /mnt/nas1/projects/lasr/blendseq/data/benchmarking/HG002/v4.2.1/HG002_GRCh38_1_22_v4.2.1_benchmark_noinconsistent.bed \
    -o /mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/benchmarking-results/HG002/ERR3684866_23 \
    --threads 60

#=============================================================================

# download benchmarking files from GIAB for HG005 (v4.2.1)
ftp https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/ChineseTrio/HG005_NA24631_son/NISTv4.2.1/README_v4.2.1.txt
ftp https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/ChineseTrio/HG005_NA24631_son/NISTv4.2.1/GRCh38/HG005_GRCh38_1_22_v4.2.1_benchmark.bed
ftp https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/ChineseTrio/HG005_NA24631_son/NISTv4.2.1/GRCh38/HG005_GRCh38_1_22_v4.2.1_benchmark.vcf.gz
ftp https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/ChineseTrio/HG005_NA24631_son/NISTv4.2.1/GRCh38/HG005_GRCh38_1_22_v4.2.1_benchmark.vcf.gz.tbi

# Run hap.py with normalisation, left-shifting and conversion from gvcf for the query 
hap.py \
    /mnt/nas1/projects/lasr/blendseq/data/benchmarking/HG005/v4.2.1/HG005_GRCh38_1_22_v4.2.1_benchmark.vcf.gz \
    /mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/run-results/ERR3687419_ILMN_22/ERR3687419_ILMN_gvcf_run22.hard-filtered.rb.g.vcf.gz \
    --engine vcfeval \
    --gender male \
    --filter-nonref \
    --convert-gvcf-query \
    --bcftools-norm \
    -L \
    --logfile /mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/benchmarking-results/HG005/happy.log \
    -V \
    --verbose \
    -r $HGREF \
    -f /mnt/nas1/projects/lasr/blendseq/data/benchmarking/HG005/v4.2.1/HG005_GRCh38_1_22_v4.2.1_benchmark.bed \
    -o /mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/benchmarking-results/HG005/ERR3687419_22 \
    --threads 60