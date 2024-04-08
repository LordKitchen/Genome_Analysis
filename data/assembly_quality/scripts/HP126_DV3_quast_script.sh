#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error.log
#SBATCH -t 00:15:00
#SBATCH -J gape_quast_2nd
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se

module load bioinfo-tools
module load quast/5.0.2

python /sw/bioinfo/quast/5.0.2/rackham/bin/quast.py \
-o ../main_output/quast/HP126 \
-R ../input_data/HP126_genome.fasta \
-t 2 \
../input_data/HP126.fasta

python /sw/bioinfo/quast/5.0.2/rackham/bin/quast.py \
-o ../main_output/quast/DV3 \
-R ../input_data/DV3_genome.fasta \
-t 2 \
../input_data/DV3.fasta