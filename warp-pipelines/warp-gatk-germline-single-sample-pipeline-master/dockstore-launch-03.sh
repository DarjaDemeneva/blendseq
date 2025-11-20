#!/bin/bash

#=============================================================================
# Script for locally running the WARP GATK Whole Genome Germline Single Sample Pipeline (local WDL script) 
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 14.11.2025
#=============================================================================

# This is for getting some run information prior to script execution
which dockers
docker --version
docker ps
whoami
id

# Set temporary directory location 
export TMPDIR=/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/
echo $TMPDIR

# Set user and group ID as explicit variables for Cromwell to map user 
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

export _JAVA_OPTIONS="-Duser_id=$(id -u) -Dgroup_id=$(id -g) -Djava.io.tmpdir=${TMPDIR}   "
# echo $_JAVA_OPTIONS

# Launching workflow (pulling the latest version from github) 
dockstore workflow launch \
    --local-entry /mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/pipelines/wdl/dna_seq/germline/single_sample/wgs/WholeGenomeGermlineSingleSample.wdl \
    --json /mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/Dockstore-03.json  

echo "Workflow complete" 

# Launching script
# tmux new -s gatk 
# conda activate wdl
# cd ~/nas-lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master
# /usr/bin/time -v bash /home/darja/nas-lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/dockstore-launch-03.sh > full_log-N.log 2> timing.log
