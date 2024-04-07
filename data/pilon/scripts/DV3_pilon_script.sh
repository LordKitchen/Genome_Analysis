#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e errorDV3.log
#SBATCH -t 01:30:00
#SBATCH -J gape_pilon_DV3_try
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se

#Load stuff

module load bioinfo-tools
module load htslib/1.19
module load bwa/0.7.17
module load samtools/1.19
module load Pilon/1.24

# BWA stuff

bwa index ../input_data/DV3_flye_assembly.fasta

bwa mem ../input_data/DV3_flye_assembly.fasta ../input_data/DV3_DNA_trimmomatic_forward_paired.fastq.gz ../input_data/DV3_DNA_trimmomatic_reverse_paired.fastq.gz > ../temp_files/DV3_bwa_alignment.sam

# SAM to BAM


samtools view -b ../temp_files/DV3_bwa_alignment.sam > ../temp_files/DV3_bwa_alignment.bam

samtools sort ../temp_files/DV3_bwa_alignment.bam -o ../temp_files/DV3_bwa_alignment_sorted.bam


samtools index ../temp_files/DV3_bwa_alignment_sorted.bam

# Actual Pilon

java -jar $PILON_HOME/pilon.jar --genome ../input_data/DV3_flye_assembly.fasta --frags ../temp_files/DV3_bwa_alignment_sorted.bam --output ../main_output/DV3 --threads 2

# Remove intermediate files (no more bam and sams)

rm ../temp_files/DV3_bwa_alignment.sam ../temp_files/DV3_bwa_alignment.bam ../temp_files/DV3_bwa_alignment_sorted.bam