#!/bin/bash
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 12
#SBATCH -e error.log
#SBATCH -t 01:00:00
#SBATCH -J gape_htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user gabrielandre.pettersson.9739@student.uu.se

module load bioinfo-tools
module load htseq/2.0.2

ANNOTATION=/domus/h1/gape9739/Genome_Analysis/data/annotation/main_output
RNA=/domus/h1/gape9739/Genome_Analysis/data/rna_mapping/main_output

htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/HP126_RNA_align_sorted_a.bam $ANNOTATION/HP126_prokka.gff > ../main_output/HP126_htseq_a.txt &
htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/HP126_RNA_align_sorted_b.bam $ANNOTATION/HP126_prokka.gff > ../main_output/HP126_htseq_b.txt &
htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/HP126_RNA_align_sorted_c.bam $ANNOTATION/HP126_prokka.gff > ../main_output/HP126_htseq_c.txt &
htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/HP126_RNA_align_sorted_R7_a.bam $ANNOTATION/HP126_prokka.gff > ../main_output/HP126_htseq_R7_a.txt &
htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/HP126_RNA_align_sorted_R7_b.bam $ANNOTATION/HP126_prokka.gff > ../main_output/HP126_htseq_R7_b.txt &
htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/HP126_RNA_align_sorted_R7_c.bam $ANNOTATION/HP126_prokka.gff > ../main_output/HP126_htseq_R7_c.txt &
htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/DV3_RNA_align_sorted_a.bam $ANNOTATION/DV3_prokka.gff > ../main_output/DV3_htseq_a.txt &
htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/DV3_RNA_align_sorted_b.bam $ANNOTATION/DV3_prokka.gff > ../main_output/DV3_htseq_b.txt &
htseq-count -t CDS -f bam -s yes -t ID -r pos $RNA/DV3_RNA_align_sorted_c.bam $ANNOTATION/DV3_prokka.gff > ../main_output/DV3_htseq_c.txt &
htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/DV3_RNA_align_sorted_R7_a.bam $ANNOTATION/DV3_prokka.gff > ../main_output/DV3_htseq_R7_a.txt &
htseq-count -t CDS -f bam -s yes -i ID -r pos $RNA/DV3_RNA_align_sorted_R7_b.bam $ANNOTATION/DV3_prokka.gff > ../main_output/DV3_htseq_R7_b.txt &
htseq-count -t CDS -f bam -s yes -t ID -r pos $RNA/DV3_RNA_align_sorted_R7_c.bam $ANNOTATION/DV3_prokka.gff > ../main_output/DV3_htseq_R7_c.txt &
wait