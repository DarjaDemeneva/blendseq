#!/usr/bin/env bash
set -euo pipefail

# Sample ID (used for destination dir naming)
SAMPLE="ERR3684866_ILMN"
RUN="19"

# Destination directory to collect QC files
DEST_BASE="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/run-results"
DEST="${DEST_BASE}/${SAMPLE}_${RUN}/metrics/"
mkdir -p "${DEST}"

# QC report directory
QC_DEST="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/data/multiqc_reports

# Declare an associative array mapping logical names -> source paths
declare -A QC_FILES

QC_FILES["agg_alignment_summary_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectAggregationMetrics/execution/ERR3684866_ILMN.alignment_summary_metrics"
QC_FILES["error_summary_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectAggregationMetrics/execution/ERR3684866_ILMN.error_summary_metrics"
QC_FILES["read_group_alignment_summary_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectReadgroupBamQualityMetrics/execution/ERR3684866_ILMN.readgroup.alignment_summary_metrics"

QC_FILES["unsorted_read_group_quality_by_cycle_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/ERR3684866_ILMN.readgroup.quality_by_cycle_metrics"
QC_FILES["unsorted_read_group_quality_distribution_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/ERR3684866_ILMN.readgroup.quality_distribution_metrics"
QC_FILES["unsorted_read_group_quality_distribution_pdf"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/ERR3684866_ILMN.readgroup.quality_distribution.pdf"

QC_FILES["unsorted_read_group_base_distribution_by_cycle_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/ERR3684866_ILMN.readgroup.base_distribution_by_cycle_metrics"
QC_FILES["unsorted_read_group_base_distribution_by_cycle_pdf"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/ERR3684866_ILMN.readgroup.base_distribution_by_cycle.pdf"

QC_FILES["agg_insert_size_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectAggregationMetrics/execution/ERR3684866_ILMN.insert_size_metrics"
QC_FILES["unsorted_read_group_insert_size_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/ERR3684866_ILMN.readgroup.insert_size_metrics"
QC_FILES["unsorted_read_group_insert_size_histogram_pdf"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-CollectUnsortedReadgroupBamQualityMetrics/shard-0/execution/ERR3684866_ILMN.readgroup.insert_size_histogram.pdf"
QC_FILES["agg_insert_size_histogram_pdf"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectAggregationMetrics/execution/ERR3684866_ILMN.insert_size_histogram.pdf"

QC_FILES["agg_quality_distribution_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectAggregationMetrics/execution/ERR3684866_ILMN.quality_distribution_metrics"
QC_FILES["agg_quality_distribution_pdf"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectAggregationMetrics/execution/ERR3684866_ILMN.quality_distribution.pdf"

QC_FILES["agg_gc_bias_summary_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectAggregationMetrics/execution/ERR3684866_ILMN.gc_bias.summary_metrics"
QC_FILES["agg_gc_bias_detail_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectAggregationMetrics/execution/ERR3684866_ILMN.gc_bias.detail_metrics"
QC_FILES["agg_gc_bias_pdf"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectAggregationMetrics/execution/ERR3684866_ILMN.gc_bias.pdf"

QC_FILES["read_group_gc_bias_summary_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectReadgroupBamQualityMetrics/execution/ERR3684866_ILMN.readgroup.gc_bias.summary_metrics"
QC_FILES["read_group_gc_bias_detail_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectReadgroupBamQualityMetrics/execution/ERR3684866_ILMN.readgroup.gc_bias.detail_metrics"
QC_FILES["read_group_gc_bias_pdf"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-AggregatedBamQC/AggregatedBamQC/beea54b7-390e-4ea0-9518-717cbfc46992/call-CollectReadgroupBamQualityMetrics/execution/ERR3684866_ILMN.readgroup.gc_bias.pdf"

QC_FILES["duplicate_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-MarkDuplicates/execution/ERR3684866_ILMN.duplicate_metrics"

QC_FILES["raw_wgs_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-CollectRawWgsMetrics/execution/ERR3684866_ILMN.raw_wgs_metrics"
QC_FILES["wgs_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-CollectWgsMetrics/execution/ERR3684866_ILMN.wgs_metrics"
QC_FILES["quality_yield_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-CollectQualityYieldMetrics/shard-0/execution/ERR3684866_ILMN.unmapped.quality_yield_metrics"

QC_FILES["gvcf_summary_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-BamToGvcf/VariantCalling/c61b4b0d-c7c6-436e-a01f-cafbe78c1d11/call-CollectVariantCallingMetrics/execution/ERR3684866_ILMN_wggss_dragen_max_qual_01.variant_calling_summary_metrics"
QC_FILES["gvcf_detail_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-BamToGvcf/VariantCalling/c61b4b0d-c7c6-436e-a01f-cafbe78c1d11/call-CollectVariantCallingMetrics/execution/ERR3684866_ILMN_wggss_dragen_max_qual_01.variant_calling_detail_metrics"

QC_FILES["cross_check_fingerprints_metrics"]="/mnt/nas1/projects/lasr/blendseq/warp-pipelines/warp-gatk-germline-single-sample-pipeline-master/tmp/14743852445737874576/cromwell-executions/WholeGenomeGermlineSingleSample/32774cc6-b120-4b08-a694-107abb6e2242/call-UnmappedBamToAlignedBam/UnmappedBamToAlignedBam/ee05efaf-d4d4-4fe3-a6c6-c05d6c1e5173/call-CrossCheckFingerprints/execution/ERR3684866_ILMN.crosscheck"

# Loop over files and symlink into DEST
for key in "${!QC_FILES[@]}"; do
    src="${QC_FILES[$key]}"
    if [[ -f "${src}" ]]; then
        ln -sf "${src}" "${DEST}/${SAMPLE}.${key}$(basename "${src##*.}" | sed 's/^/./')"
    else
        echo "Warning: missing file for ${key}: ${src}" >&2
    fi
done

echo "QC files collected in: ${DEST}"
echo "Run MultiQC with:"
echo "  multiqc ${DEST} -n ${SAMPLE}_${RUN}_multiqc -o ${QC_DEST}/${SAMPLE}_${RUN}"

