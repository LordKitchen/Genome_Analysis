#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCG -e error.log
#SBATCH -t 00:30:00
#SBATCH -J gape_fastq_test
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se
#SBATCH --qos=short

module load bioinfo-tools
module load FastQC/0.11.9

fastqc /crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/DNA_reads/short_reads/SRR24413065_1.fastq.gz -o ../main_output/ 

fastqc /crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/DNA_reads/short_reads/SRR24413065_2.fastq.gz -o ../main_output/ 

fastqc /crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/DNA_reads/short_reads/SRR24413080_1.fastq.gz -o ../main_output/  

fastqc /crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/DNA_reads/short_reads/SRR24413080_2.fastq.gz -o ../main_output/ 