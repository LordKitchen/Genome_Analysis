#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH --reservation=uppmax2024-2-7_2
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCG -e error.log
#SBATCH -t 00:30:00
#SBATCH -J gape_trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se


module load bioinfo-tools
module load trimmomatic/0.39

PROJDIR=/crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/DNA_reads/short_reads

trimmomatic PE phred33 \
-trimlog HP126_trimlog.log \
-summary HP126_summary_trimmomatic.txt \
-basein $PROJDIR/SRR24413065_1.fastq.gz $PROJDIR/SRR24413065_2.fastq.gz \
-baseout ../main_output/HP126_DNA_trimmomatic_forward_paired.fastq.gz ../main_output/HP126_DNA_trimmomatic_forward_unpaired.fastq.gz ../main_output/HP126_DNA_trimmomatic_reverse_paired.fastq.gz ../main_output/HP126_DNA_trimmomatic_reverse_unpaired.fastq.gz \
ILLUMINACLIP:TruSeq2-PE.fa:2:30:10 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:4:20 \
MINLEN:70

trimmomatic PE phred33 \
-trimlog DV3_trimlog.log \
-summary DV3_summary_trimmomatic.txt \
-basein $PROJDIR/SRR24413080_1.fastq.gz $PROJDIR/SRR24413080_2.fastq.gz \
-baseout ../main_output/DV3_DNA_trimmomatic_forward_paired.fastq.gz ../main_output/DV3_DNA_trimmomatic_forward_unpaired.fastq.gz ../main_output/DV3_DNA_trimmomatic_reverse_paired.fastq.gz ../main_output/DV3_DNA_trimmomatic_reverse_unpaired.fastq.gz \
ILLUMINACLIP:TruSeq2-PE.fa:2:30:10 \
LEADING:25 \
TRAILING:25 \
SLIDINGWINDOW:4:20 \
MINLEN:70
