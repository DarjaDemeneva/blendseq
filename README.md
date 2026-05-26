# GATK-DRAGEN implementation repository 

This repositroy contains source code for the execution of GATK-DRAGEN pipeline for Next Generation Sequencing (NGS) data analysis  
- Utilises short-reads  
- Alignment with DRAGMAP  
- Variant calling with HaplotypeCaller in DRAGEN max quality mode   

Data directories have been omitted  

The pipeline has been cloned from https://github.com/broadinstitute/warp  

WholeGenomeGermlinSingleSample.wdl  
Version [3.3.6](https://github.com/broadinstitute/warp/blob/develop/pipelines/wdl/dna_seq/germline/single_sample/wgs/WholeGenomeGermlineSingleSample.changelog.md#336)  

VariantCalling.wdl  
Version [2.2.7](https://github.com/broadinstitute/warp/blob/develop/pipelines/wdl/dna_seq/germline/variant_calling/VariantCalling.changelog.md#227)  

Some task parameters have been modified to accomodate local machine resources   