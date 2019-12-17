#!/bin/bash
sample=$1
thread=5

echo "start: sample: $sample thread: $thread"
date

#step1: mapping by bowtie
fq1="../fq/trimmed/"$sample"_combined_Clean_R1.fastq.gz"
fq2="../fq/trimmed/"$sample"_combined_Clean_R2.fastq.gz"
zcat $fq1 | head -4
index="/home/gangcai/WorkSpace1/SoftwareIndex/Bowtie/Human/Gencode_human_28/GRCh38"
#index="/home/gangcai/shared_space/SoftwareIndex/Bowtie/mouse/Gencode_mouse_M18/GRCm38"
bowtie2 -t -q -k 3  -N 1 -L 25 -p $thread --no-mixed --no-discordant -x $index -1 $fq1 -2 $fq2 -S "$sample".sam 
echo "completed"
date

