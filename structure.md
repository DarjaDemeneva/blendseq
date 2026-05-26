# Repository Structure

```ini
blendseq/
├── 📊 data/                           # Input data and GIAB truth sets 
│   ├── benchmarking/                  # Sample datasets for validation
│   │   ├── HG002/                     # Benchmark genome HG002
│   │   └── HG005/                     # Benchmark genome HG005
│   └── unaligned-bam/                 # Raw sequencing data in uBAM format 
│       ├── ERR3684866_ILMN.unmapped.bam
│       └── ERR3687419_ILMN.unmapped.bam
├── 🔧 src/                            # Source code and scripts
│   ├── benchmarking/                  # Performance validation scripts
│   │   └── gatk-dragen-multiqc.sh     # hap.py report generation
│   ├── fastqc/                        # Quality control
│   │   └── fastqc.sh                  # FastQC wrapper script
│   ├── synthetic-reads/               # Simulation tools
│   │   └── simulate-illumina.sh       # Read simulator
│   └── unmapped-bam/                  # BAM processing
│       ├── ubam-log.log               # Processing logs
│       ├── unmapped-bam.sh            # Main BAM conversion (raw FASTQ to uBAM)
│       └── unmapped-bam-simulation.sh # BAM processing for simulated reads 
└── 🚀 warp-pipelines/                 # WARP workflow engine
    ├── data/                          # Pipeline outputs
    │   ├── benchmarking-results/      # Benchmark outputs and metrics
    │   ├── call-logs/                 # Task logs
    │   ├── fastqc_reports/            # QC reports
    │   ├── multiqc_reports/           # Aggregated QC
    │   ├── run-logs/                  # Execution logs
    │   ├── run-results/               # Final pipeline outputs
    │   └── warp-gatk-dragen-input-files-01/ # Input files for GATK-DRAGEN pipeline (from GATK public google bucket)
    └── warp-gatk-germline-single-sample-pipeline-master/
        ├── cromwell/                  # Workflow executor .jar files (cromwell-91.jar and womtool-91.jar)
        ├── cromwell.conf              # Cromwell config
        ├── cromwell-executions1/      # Execution directory 
        ├── Dockstore-*.json           # Pipeline execution and inputs definitions
        ├── logs/                      # Workflow logs
        ├── pipelines/                 # WDL pipeline scripts
        ├── structs/                   # Shared data structures
        ├── tasks/                     # WDL task scripts 
        ├── wdl_env.yml                # Environment definitions 
        └── workflow-options.json      # Workflow execution options
```