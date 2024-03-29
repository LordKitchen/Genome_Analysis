#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error.log
#SBATCH -t 00:10:00
#SBATCH -J gape_trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se


module load bioinfo-tools
module load trimmomatic/0.39

PROJDIR=/crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/DNA_reads/short_reads

trimmomatic PE \
-threads 2 \
-trimlog ../secondary_output/HP126_trimlog.log \
-summary ../secondary_output/HP126_summary_trimmomatic.txt \
$PROJDIR/SRR24413065_1.fastq.gz $PROJDIR/SRR24413065_2.fastq.gz \
../main_output/HP126_DNA_trimmomatic_forward_paired.fastq.gz ../main_output/HP126_DNA_trimmomatic_forward_unpaired.fastq.gz ../main_output/HP126_DNA_trimmomatic_reverse_paired.fastq.gz ../main_output/HP126_DNA_trimmomatic_reverse_unpaired.fastq.gz \
ILLUMINACLIP:TruSeq2-PE.fa:2:30:10 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:4:20 \
MINLEN:200

trimmomatic PE \
-threads 2 \
-trimlog DV3_trimlog.log \
-summary DV3_summary_trimmomatic.txt \
$PROJDIR/SRR24413080_1.fastq.gz $PROJDIR/SRR24413080_2.fastq.gz \
../main_output/DV3_DNA_trimmomatic_forward_paired.fastq.gz ../main_output/DV3_DNA_trimmomatic_forward_unpaired.fastq.gz ../main_output/DV3_DNA_trimmomatic_reverse_paired.fastq.gz ../main_output/DV3_DNA_trimmomatic_reverse_unpaired.fastq.gz \
ILLUMINACLIP:TruSeq2-PE.fa:2:30:10 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:4:20 \
MINLEN:200


