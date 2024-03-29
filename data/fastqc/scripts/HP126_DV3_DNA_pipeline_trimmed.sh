#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error.log
#SBATCH -t 00:10:00
#SBATCH -J gape_fastqc_trimmed
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se

#Load modules fastqc and multiqc

module load bioinfo-tools
module load FastQC/0.11.9
module load MultiQC/1.12

#Name of the output directory inside main_output
OUTPUT=trim_20_min_200


#Runs fastqc, takes all files from input data and outputs html and zip in designated out.
fastqc ../input_data/* -o ../main_output/$OUTPUT

#Multiqc takes the output zip files and makes its own output to the same directory. -f overrides old names.

multiqc ../main_output/$OUTPUT -o ../main_output/$OUTPUT -f


