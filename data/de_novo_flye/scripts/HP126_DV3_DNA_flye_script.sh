#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH --reservation=uppmax2024-2-7_2
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error.log
#SBATCH -t 08:30:00
#SBATCH -J gape_flye_first_try
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se


module load bioinfo-tools
module load Flye/2.9.1

PROJDIR=/crex/proj/uppmax2024-2-7/Genome_Analysis/2_Beganovic_2023/DNA_reads

flye --nano-raw $PROJDIR/SRR24413066.fastq.gz --out-dir ../main_output/ --threads 2

flye --nano-raw $PROJDIR/SRR24413081.fastq.gz --out-dir ../main_output/ --threads 2

