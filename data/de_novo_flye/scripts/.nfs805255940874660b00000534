#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error_DV3.log
#SBATCH -t 02:30:00
#SBATCH -J gape_flye_second_try
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se


module load bioinfo-tools
module load Flye/2.9.1

PROJDIR=/crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/DNA_reads



flye --nano-raw $PROJDIR/SRR24413080.fastq.gz --out-dir ../main_output/ --threads 2
