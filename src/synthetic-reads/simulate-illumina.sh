#!/bin/bash

#=============================================================================
# Using ART to create synthetic Ilumina reads from an GRCh38 reference genome (obtained from Broad gc)   
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 07.08.2025
#=============================================================================

conda activate simulate

art_illumina \
  -ss HS25 \
  -i /home/darja/nas1/blendseq/warp-pipelines/data/warp-gatk-dragen-input-files-01/reference-and-index/Homo_sapiens_assembly38.fasta \
  -l 150 \
  -f 2 \ # specify low 
  -p \
  -m 300 \
  -s 10 \
  -o simulated 

# specify low coverage x2 using the -f flag 