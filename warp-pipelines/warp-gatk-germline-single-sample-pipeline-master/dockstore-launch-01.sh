#!/bin/bash

#=============================================================================
# Script for locally running the WARP GATK Whole Genome Germline Single Sample Pipeline 
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 25.07.2025
#=============================================================================

which docker
docker --version
docker ps
whoami
id

export TMPDIR=/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp
echo $TMPDIR
export _JAVA_OPTIONS="-Djava.io.tmpdir=$TMPDIR"

dockstore workflow launch --entry github.com/broadinstitute/warp/WholeGenomeGermlineSingleSample:master --json /home/darja/nas1/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/Dockstore.json