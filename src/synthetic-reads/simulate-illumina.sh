#!/bin/bash

#=============================================================================
# Using ART to create synthetic Ilumina reads from an GRCh38 reference genome (obtained from Broad gc)   
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 07.08.2025
#=============================================================================

# conda activate simulate

art_illumina \
  -ss HS20 \
  -i /home/darja/nas1/blendseq/warp-pipelines/data/warp-gatk-dragen-input-files-01/reference-and-index/Homo_sapiens_assembly38.fasta \
  -l 100 \
  -f 20 \
  -p \
  -m 500 \
  -s 50 \
  -na \
  -o simulated 

 