#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -e error.log
#SBATCH -t 00:10:00
#SBATCH -J gape_blast
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se

#Load stuff

module load bioinfo-tools
module load blast/2.15.0+

# Create BLAST database for reference genome
makeblastdb -in ../input_data/R7_genome.fasta -dbtype nucl -out R7_db

# Create BLAST database for HP126
makeblastdb -in ../input_data/HP126.fasta -dbtype nucl -out HP126_db

# Create BLAST database for genome2
makeblastdb -in ../input_data/DV3.fasta -dbtype nucl -out DV3_db


# Compare HP126 with reference genome using 99% identity threshold
blastn -query ../input_data/HP126.fasta -db R7_db -out ../main_output/HP126_vs_reference.txt \
       -perc_identity 99 -outfmt 6

# Compare DV3 with reference genome using 99% identity threshold
blastn -query ../input_data/DV3.fasta -db R7_db -out ../main_output/DV3_vs_reference.txt \
       -perc_identity 99 -outfmt 6

# Compare genome1 with genome2 using 99% identity threshold
blastn -query ../input_data/HP126.fasta -db DV3_db -out ../main_output/HP126_vs_DV3.txt \
       -perc_identity 99 -outfmt 6