#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error_DV3_a.log
#SBATCH -t 01:00:00
#SBATCH -J gape_bwa2
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se


#Load stuff

module load bioinfo-tools
module load htslib/1.19
module load bwa/0.7.17
module load samtools/1.19

PROJDIR=/crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/RNA_reads

STORAGE=/proj/uppmax2024-2-7/nobackup/work

bwa index ../input_data/DV3_assembly.fasta 


bwa mem ../input_data/DV3_assembly.fasta $PROJDIR/SRR24516458_1.fastq.gz $PROJDIR/SRR24516458_2.fastq.gz > $STORAGE/DV3_RNA_align_a.sam


#Samtools


samtools view -b $STORAGE/DV3_RNA_align_a.sam > ../temp_files/DV3_RNA_align_a.bam



samtools sort ../temp_files/DV3_RNA_align_a.bam -o ../main_output/DV3_RNA_align_sorted_a.bam


samtools index ../main_output/DV3_RNA_align_sorted_a.bam

rm $STORAGE/DV3_RNA_align_a.sam ../temp_files/DV3_RNA_align_a.bam