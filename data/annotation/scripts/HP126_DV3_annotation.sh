#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error.log
#SBATCH -t 01:30:00
#SBATCH -J gape_prokka
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se
#SBATCH --reservation=uppmax2024-2-7_3

module load bioinfo-tools
module load prokka/1.45-5b58020

prokka \
--outdir ../main_output/ \
--force \
--prefix HP126_ \
../input_data/HP126_assembly.fasta

prokka \
--outdir ../main_output/ \
--force \
--prefix DV3_ \
../input_data/DV3_assembly.fasta