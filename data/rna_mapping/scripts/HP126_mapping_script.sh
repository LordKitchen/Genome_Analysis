#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -e error_HP126.log
#SBATCH -t 01:00:00
#SBATCH -J gape_bwa1
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se

#Load stuff

module load bioinfo-tools
module load htslib/1.19
module load bwa/0.7.17
module load samtools/1.19

PROJDIR=/crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/RNA_reads

STORAGE=/proj/uppmax2024-2-7/nobackup/work

bwa index ../input_data/HP126_assembly.fasta 

bwa mem ../input_data/HP126_assembly.fasta $PROJDIR/SRR24516459_1.fastq.gz > $STORAGE/HP126_RNA_align_c.sam &

bwa mem ../input_data/HP126_assembly.fasta $PROJDIR/SRR24516460_1.fastq.gz > $STORAGE/HP126_RNA_align_b.sam &

bwa mem ../input_data/HP126_assembly.fasta $PROJDIR/SRR24516461_1.fastq.gz > $STORAGE/HP126_RNA_align_a.sam &
wait


#Samtools

samtools view -b $STORAGE/HP126_RNA_align_c.sam > ../temp_files/HP126_RNA_align_c.bam

samtools view -b $STORAGE/HP126_RNA_align_b.sam > ../temp_files/HP126_RNA_align_b.bam

samtools view -b $STORAGE/HP126_RNA_align_a.sam > ../temp_files/HP126_RNA_align_a.bam


samtools sort ../temp_files/HP126_RNA_align_c.bam -o ../main_output/HP126_RNA_align_sorted_c.bam

samtools sort ../temp_files/HP126_RNA_align_b.bam -o ../main_output/HP126_RNA_align_sorted_b.bam

samtools sort ../temp_files/HP126_RNA_align_a.bam -o ../main_output/HP126_RNA_align_sorted_a.bam


samtools index ../main_output/HP126_RNA_align_sorted_c.bam

samtools index ../main_output/HP126_RNA_align_sorted_b.bam

samtools index ../main_output/HP126_RNA_align_sorted_a.bam

rm $STORAGE/HP126_RNA_align_a.sam $STORAGE/HP126_RNA_align_b.sam $STORAGE/HP126_RNA_align_c.sam ../temp_files/HP126_RNA_align_a.bam ../temp_files/HP126_RNA_align_b.bam ../temp_files/HP126_RNA_align_c.bam