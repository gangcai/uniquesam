# uniquesam
Get uniquely mapped reads from fastq files (ChIPseq data)

## procedure
### mapping
step1_map.sh
### extract uniquely mapped reads from sam file
python step2_extract_uniq.py samplename   #samplename.sam should be under current directory
### remove duplicates
step3_rmdup.sh
