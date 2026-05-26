#!/usr/bin/env bash

#=============================================================================
# Script for launching the WARP GATK Germline Single Sample pipeline
# Author: Darja
# Generated for bioinformatics analysis
# Date: 26.5.2026
#=============================================================================


# set base directory variable
BASE=/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master


#=============================================================================


# Install Cromwell and move to working directory (Downloaded cromwell-91.jar directly from GitHub: https://github.com/broadinstitute/cromwell/releases/tag/91) 
mkdir "$BASE/cromwell"
cp ./cromwell-91.jar "$BASE/cromwell/"
cp ./womtool-91.jar "$BASE/cromwell/"
chmod +x "$BASE/cromwell/*"


#=============================================================================


# Install Java if not already available (Cromwell dependency)
sudo apt install unzip 
sudo apt install zip 
curl -s "https://get.sdkman.io" | bash

# open new terminal to run: 
source "$HOME/.sdkman/bin/sdkman-init.sh" 
# initializes the SDKMAN! environment in your current shell session, setting up the necessary environment variables and functions that let you use the sdk command to manage Java and other SDKs. 

# to confirm installation:
sdk version

sdk install java 17.0.9-tem


#=============================================================================


# navigate to workflow execution directory 
cd "$BASE/cromwell-executions"

# launch workflow with timing monitoring
/usr/bin/time -v -o timing.log \
java \
    -Dconfig.file="$BASE/cromwell.conf" \
    -jar "$BASE/cromwell/cromwell-91.jar" \
    run "$BASE/pipelines/wdl/dna_seq/germline/single_sample/wgs/WholeGenomeGermlineSingleSample.wdl" \
    -i "$BASE/Dockstore-HG002.json" \
    -o "$BASE/workflow-options.json" \
    > "$BASE/full_log-23.2-dragenref.log" 2>&1


#=============================================================================