#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error.log
#SBATCH -t 00:10:00
#SBATCH -J gape_mummerplot_2nd
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se

#Load modukes
module load bioinfo-tools
module load MUMmer/4.0.0rc1


#Change the directory to main output, because mummerplot is stupid and will only output in the working directory.
cd ../main_output

#Nucmer with default settings, output is determined by the delta command. 

nucmer --delta ../temp_files/HP126_mummer.delta --threads 2 ../input_data/HP126_genome.fasta ../input_data/HP126.fasta

nucmer --delta ../temp_files/DV3_mummer.delta --threads 2 ../input_data/DV3_genome.fasta ../input_data/DV3.fasta


nucmer --delta ../temp_files/HP126_R7_mummer.delta --threads 2 ../input_data/R7_genome.fasta ../input_data/HP126.fasta

nucmer --delta ../temp_files/DV3_R7_mummer.delta --threads 2 ../input_data/R7_genome.fasta ../input_data/DV3.fasta

nucmer --delta ../temp_files/HP126_DV3_mummer.delta --threads 2 ../input_data/HP126.fasta ../input_data/DV3.fasta

#Mummerplot adapted for nucmer using filter and -l, with -R and -Q specifying that I have both reference and query

mummerplot --filter --png --large -R ../input_data/HP126_genome.fasta -Q ../input_data/HP126.fasta -l -p HP126_mummerplot ../temp_files/HP126_mummer.delta

mummerplot --filter --png --large -R ../input_data/DV3_genome.fasta -Q ../input_data/DV3.fasta -l -p DV3_mummerplot ../temp_files/DV3_mummer.delta


mummerplot --filter --png --large -R ../input_data/R7_genome.fasta -Q ../input_data/HP126.fasta -l -p HP126_vs_R7_mummerplot ../temp_files/HP126_R7_mummer.delta

mummerplot --filter --png --large -R ../input_data/R7_genome.fasta -Q ../input_data/DV3.fasta -l -p DV3_vs_R7_mummerplot ../temp_files/DV3_R7_mummer.delta

mummerplot --filter --png --large -R ../input_data/HP126.fasta -Q ../input_data/DV3.fasta -l -p HP126_vs_DV3_mummerplot ../temp_files/HP126_DV3_mummer.delta
