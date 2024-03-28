#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH --reservation=uppmax2024-2-7_2
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error.log
#SBATCH -t 00:10:00
#SBATCH -J gape_fastq_trimmed
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se

module load bioinfo-tools
module load FastQC/0.11.9

fastqc ../input_data/* -o ../main_output/