#!/bin/bash

#=============================================================================
# Script for locally running the WARP GATK Whole Genome Germline Single Sample Pipeline - with small simulated genome 
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 05.08.2025
#=============================================================================

which docker
docker --version
docker ps
whoami
id

export TMPDIR=/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp
echo $TMPDIR
export _JAVA_OPTIONS="-Djava.io.tmpdir=$TMPDIR"

cd /home/darja/nas1/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/pipelines/broad/dna_seq/germline/single_sample/wgs

# This script launches the pipeline (local versoin with the edited wdl script) using the Dragen hash table and reference previously used for an alignmnet - found in /home/darja/nas1/blendseq/data/align/align-ilmn/hash-table
dockstore workflow launch --local-entry /home/darja/nas1/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/pipelines/broad/dna_seq/germline/single_sample/wgs/WholeGenomeGermlineSingleSample.wdl --json /home/darja/nas1/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/Dockstore-02-simulation.json