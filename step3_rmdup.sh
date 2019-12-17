#!/bin/bash
sample=$1
thread=10

echo "start: sample: $sample thread: $thread"
date

#sam(ordered by name) to bam
samtools view --threads $thread -Sb "$sample".sam > "$sample".bam

# Add ms and MC tags for markdup to use later
samtools fixmate --threads $thread -m "$sample".bam "$sample".fixmate.bam

# Markdup needs position order
samtools sort --threads $thread -m 1000M -o "$sample".positionsort.bam "$sample".fixmate.bam

#clean file
rm "$sample".fixmate.bam

# Finally mark duplicates
#remove duplicates
samtools markdup -r --threads $thread -s "$sample".positionsort.bam "$sample".rmdup.bam

#clean file
rm "$sample".positionsort.bam

#index
samtools index "$sample".rmdup.bam > "$sample".index.log

echo "completed"
date
