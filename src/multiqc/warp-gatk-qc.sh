#!/usr/bin/env bash

#=============================================================================
# Script for collecting all QC files from the Whole Genome Germline Single Sample pipeline for downstream MultiQC
# Author: Darja 
# Generated for bioinformatics analysis
# Date: 9.12.2025
#=============================================================================

conda activate ubam

set -euo pipefail



# Sample ID (used for destination dir naming)
SAMPLE="sorted-ERR3687419_ILMN"
RUN="21"
TMP_DIR="7024769096287923"

# Destination directory to collect QC files
DEST_BASE="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/run-results"
DEST="${DEST_BASE}/${SAMPLE}_${RUN}/metrics/"
# mkdir -p "${DEST}"

# # QC report directory
QC_DEST="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/multiqc_reports"

# # Declare an associative array mapping logical names -> source paths
# declare -A QC_FILES

# # Base Cromwell path for this workflow
# BASE="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/${TMP_DIR}/cromwell-executions/WholeGenomeGermlineSingleSample/0c205b5c-e940-4d91-84d8-a29a2e6929b0"

# QC_FILES["agg_alignment_summary_metrics"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectAggregationMetrics/execution/sorted-ERR3687419_ILMN.alignment_summary_metrics"
# QC_FILES["error_summary_metrics"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectAggregationMetrics/execution/sorted-ERR3687419_ILMN.error_summary_metrics"
# QC_FILES["read_group_alignment_summary_metrics"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectReadgroupBamQualityMetrics/execution/sorted-ERR3687419_ILMN.readgroup.alignment_summary_metrics"

# QC_FILES["unsorted_read_group_quality_by_cycle_metrics"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/sorted-ERR3687419_ILMN.readgroup.quality_by_cycle_metrics"
# QC_FILES["unsorted_read_group_quality_distribution_metrics"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/sorted-ERR3687419_ILMN.readgroup.quality_distribution_metrics"
# QC_FILES["unsorted_read_group_quality_distribution_pdf"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/sorted-ERR3687419_ILMN.readgroup.quality_distribution.pdf"

# QC_FILES["unsorted_read_group_base_distribution_by_cycle_metrics"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/sorted-ERR3687419_ILMN.readgroup.base_distribution_by_cycle_metrics"
# QC_FILES["unsorted_read_group_base_distribution_by_cycle_pdf"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/sorted-ERR3687419_ILMN.readgroup.base_distribution_by_cycle.pdf"

# QC_FILES["agg_insert_size_metrics"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectAggregationMetrics/execution/sorted-ERR3687419_ILMN.insert_size_metrics"
# QC_FILES["unsorted_read_group_insert_size_metrics"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/sorted-ERR3687419_ILMN.readgroup.insert_size_metrics"
# QC_FILES["unsorted_read_group_insert_size_histogram_pdf"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/sorted-ERR3687419_ILMN.readgroup.insert_size_histogram.pdf"
# QC_FILES["agg_insert_size_histogram_pdf"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectAggregationMetrics/execution/sorted-ERR3687419_ILMN.insert_size_histogram.pdf"

# QC_FILES["agg_quality_distribution_metrics"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectAggregationMetrics/execution/sorted-ERR3687419_ILMN.quality_distribution_metrics"
# QC_FILES["agg_quality_distribution_pdf"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectAggregationMetrics/execution/sorted-ERR3687419_ILMN.quality_distribution.pdf"

# QC_FILES["agg_gc_bias_summary_metrics"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectAggregationMetrics/execution/sorted-ERR3687419_ILMN.gc_bias.summary_metrics"
# QC_FILES["agg_gc_bias_detail_metrics"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectAggregationMetrics/execution/sorted-ERR3687419_ILMN.gc_bias.detail_metrics"
# QC_FILES["agg_gc_bias_pdf"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectAggregationMetrics/execution/sorted-ERR3687419_ILMN.gc_bias.pdf"

# QC_FILES["read_group_gc_bias_summary_metrics"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectReadgroupBamQualityMetrics/execution/sorted-ERR3687419_ILMN.readgroup.gc_bias.summary_metrics"
# QC_FILES["read_group_gc_bias_detail_metrics"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectReadgroupBamQualityMetrics/execution/sorted-ERR3687419_ILMN.readgroup.gc_bias.detail_metrics"
# QC_FILES["read_group_gc_bias_pdf"]="${BASE}/call-AggregatedBamQC/AggregatedBamQC/d488f2ac-aa29-402d-9439-54f7541f2377/call-CollectReadgroupBamQualityMetrics/execution/sorted-ERR3687419_ILMN.readgroup.gc_bias.pdf"

# QC_FILES["duplicate_metrics"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-MarkDuplicates/execution/sorted-ERR3687419_ILMN.duplicate_metrics"

# QC_FILES["raw_wgs_metrics"]="${BASE}/call-CollectRawWgsMetrics/execution/sorted-ERR3687419_ILMN.raw_wgs_metrics"
# QC_FILES["wgs_metrics"]="${BASE}/call-CollectWgsMetrics/execution/sorted-ERR3687419_ILMN.wgs_metrics"
# QC_FILES["quality_yield_metrics"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-CollectQualityYieldMetrics/shard-0/execution/sorted-ERR3687419_ILMN.unmapped.quality_yield_metrics"

# QC_FILES["gvcf_summary_metrics"]="${BASE}/call-BamToGvcf/VariantCalling/4f5e5eb8-6060-4966-8ad6-2fe9507d7b42/call-CollectVariantCallingMetrics/execution/sorted-ERR3687419_ILMN_wggss_dragen_max_qual_01.variant_calling_summary_metrics"
# QC_FILES["gvcf_detail_metrics"]="${BASE}/call-BamToGvcf/VariantCalling/4f5e5eb8-6060-4966-8ad6-2fe9507d7b42/call-CollectVariantCallingMetrics/execution/sorted-ERR3687419_ILMN_wggss_dragen_max_qual_01.variant_calling_detail_metrics"

# QC_FILES["cross_check_fingerprints_metrics"]="${BASE}/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/b3766e0b-927e-4e59-a50b-50ba61a28af6/call-CrossCheckFingerprints/execution/sorted-ERR3687419_ILMN.crosscheck"

# # Loop over files and symlink into DEST
# for key in "${!QC_FILES[@]}"; do
#     src="${QC_FILES[$key]}"
#     if [[ -f "${src}" ]]; then
#         ln -sf "${src}" "${DEST}/${SAMPLE}.${key}$(basename "${src##*.}" | sed 's/^/./')"
#     else
#         echo "Warning: missing file for ${key}: ${src}" >&2
#     fi
# done

echo "QC files collected in: ${DEST}"
echo "Run MultiQC with:"
echo "  multiqc ${DEST} -n ${SAMPLE}_${RUN}_multiqc -o ${QC_DEST}/${SAMPLE}_${RUN}"
echo "Run MultiQC on Tales in conda env qc" 
