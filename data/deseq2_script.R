install.packages("htmltools")
library(htmltools)
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.18")
BiocManager::install("DESeq2")
BiocManager::install("apeglm")
BiocManager::install("vsn")
BiocManager::install("IHW")

install.packages("pheatmap")


library( DESeq2 )
library(ggplot2)
library(apeglm)
library(IHW)
library(pheatmap)

directory <- "C://Users//Gabriel Pettersson//Downloads//htseq"


HP126Files <- grep("HP126",list.files(directory),value=TRUE)
DV3Files <- grep("DV3",list.files(directory),value=TRUE)

HP126Condition <- sub("^.*_htseq_([a-c]).txt$", "\\1", HP126Files)
DV3Condition <- sub("^.*_htseq_([a-c]).txt$", "\\1", DV3Files)


HP126Table <- data.frame(sampleName = HP126Files,
                          fileName = HP126Files,
                          condition = HP126Condition)
HP126Table$condition <- c("HP126", "HP126", "HP126", "R7", "R7", "R7")


DV3Table <- data.frame(sampleName = DV3Files,
                          fileName = DV3Files,
                          condition = DV3Condition)
DV3Table$condition <- c("DV3", "DV3", "DV3", "R7", "R7", "R7")


ddsHP126 <- DESeqDataSetFromHTSeqCount(sampleTable = HP126Table,
                                       directory = directory,
                                       design= ~ condition)

ddsDV3 <- DESeqDataSetFromHTSeqCount(sampleTable = DV3Table,
                                       directory = directory,
                                       design= ~ condition)

ddsHP126 <- DESeq(ddsHP126)
ddsDV3 <- DESeq(ddsDV3)

resH <- results(ddsHP126)
resD <- results(ddsDV3)

ddsHP126_filtered <- ddsHP126[!(resH$pvalue > 0.05 | is.na(resH$pvalue)), ]


ddsDV3_filtered <- ddsDV3[!(resD$pvalue > 0.05 | is.na(resD$pvalue)), ]
ntdDV3 <- normTransform(ddsDV3_filtered)

resH_filtered <- resH[!(resH$pvalue > 0.05 | is.na(resH$pvalue)), ]
resD_filtered <- resD[!(resD$pvalue > 0.05 | is.na(resD$pvalue)), ]


log2FC_values <- resD_filtered$log2FoldChange
select <- order(abs(log2FC_values), decreasing=TRUE)[1:20]

# Heatmap
ntdH <- normTransform(ddsHP126_filtered)
df <- as.data.frame(colData(ddsDV3_filtered))
pheatmap(assay(ntdDV3)[select,], cluster_rows=FALSE, show_rownames=TRUE,
         cluster_cols=FALSE, annotation_col=df)

#volcano plot

# Define a function to create a volcano plot
create_volcano_plot <- function(res, title) {
  # Create a data frame with log2 fold change and -log10 p-value
  volcano_data <- data.frame(log2FoldChange = res$log2FoldChange,
                             negLog10PValue = -log10(res$pvalue))
  
  # Create the volcano plot using ggplot2
  volcano_plot <- ggplot(volcano_data, aes(x = log2FoldChange, y = negLog10PValue)) +
    geom_point(aes(color = (abs(log2FoldChange) > 1 & negLog10PValue > 1.3)),
               alpha = 0.5, size = 1.5) +
    scale_color_manual(values = c("black", "red"),
                       labels = c("Not Significant", "Significant")) +
    theme_minimal() +
    labs(x = "Log2 Fold Change", y = "-Log10 P-Value",
         title = title,
         color = "Significance") +
    geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "blue") +
    geom_hline(yintercept = 1.3, linetype = "dashed", color = "blue")
  
  # Return the plot
  return(volcano_plot)
}

# Create the volcano plots for the filtered results datasets
volcano_plot_HP126 <- create_volcano_plot(resH_filtered, "Volcano Plot for HP126")
volcano_plot_DV3 <- create_volcano_plot(resD_filtered, "Volcano Plot for DV3")

# Display the plots
win.graph()
print(volcano_plot_HP126)
print(volcano_plot_DV3)

idx <- identify(resH_filtered$log2FoldChange, -log10(resH_filtered$pvalue), plot=TRUE, tolerance = 0.25, labels=rownames(resH_filtered))
rownames(resH_filtered)[idx]

# MA plots

resHLFC <- lfcShrink(ddsHP126_filtered, coef="condition_R7_vs_HP126", type="apeglm")
resDLFC <- lfcShrink(ddsDV3_filtered, coef="condition_R7_vs_DV3", type="apeglm")


plotMA(resHLFC, ylim=c(-5,5))

plotMA(resDLFC, ylim=c(-5,5))

# Chiefly for finding the expression of select genes and whether they are significant

log2FoldChange = resH_filtered$log2FoldChange
negLog10PValue = -log10(resH_filtered$pvalue)

resH$log2FoldChange[rownames(resH) == "GKLDFEFB_00385"] # etc
resD$log2FoldChange[rownames(resD) == "PLNMODBO_00089"] # etc


resH_filtered$log2FoldChange[rownames(resH_filtered) == "GKLDFEFB_03102"] # etc
resD_filtered$log2FoldChange[rownames(resD_filtered) == "PLNMODBO_06172"] # etc


