
THIS IS THE DIRECTORY FOR ALL MATERIAL RELATING TO FASTQC QUALITY CONTROL FOR ILLUMINA READS, TRIMMED AND UNTRIMMED.

-input_data specifically contains the same files as the main_output in "trimming", this directory is specified when fastqc is run for the trimmed data.
-main_output contains the html files output by fastq and the corresponding multiqc output. These are stored in separate directories for different parameters of trimmomatic.
The directory names are "trimmed_x_min_y" where x indicates the minimum read quality and y the minimum read length settings. There is also a directory for the untrimmed fastqc results.

-secondary_output contains the .zip files, stored in identical directories as main_output.

-scripts contains a script file for untrimmed fastqc, trimmed fastqc, multiqc and a combined fastqc to multiqc pipeline, which is the preffered one.