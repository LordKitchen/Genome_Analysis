#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error.log
#SBATCH -t 00:02:00
#SBATCH -J gape_multiqc_trimmed
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se

module load bioinfo-tools
module load MultiQC/1.12

multiqc ../secondary_output/trim_base_25_min_70 -o ../main_output/ -f
