# Proyecto-Uni5
###### Miguel Amaro

This repository contains scripts to perform genetic population analyses on data of wolves, downloaded from Schweizer, Rena M. et al. (2015), Data from: Targeted capture and resequencing of 1040 genes reveal environmentally driven functional variation in gray wolves, Dryad, Dataset, https://doi.org/10.5061/dryad.8g0s3. These analyses are performed using VCFtools and include counting the number of SNP's per individual, estimating allele frequencies and heterozygosities, as well as estimates of genetic diversity. The repository also contains an Rmarkdown to perform a PCA using the R packages SNPrelate.

The order in which the script should be run is as follows:

### Get Data
The `get_data.sh` script creates the data directory and downloads to it the genetic data in vcf format from the Dryad repository.

### Running VCFtools to perform the analyses.
The `run_vcftools.sh` script performs the following test on the wolves.vcf file:
  * Count the total number of individuals and SNPs in the file
  * Estimate allele frequencies of every allele in all individuals and saves the result to a file in the data directory.
  * Counts the number of sites with no missing data.
  * Estimates allele frequencies for all the sites with no missing data and saves result to a file.
  * Counts the number of sites with minimum allele frequency (MAF) less than 0.05.
  * Estimates the heterozygosity of every individual.
  * Estimates nucelotide diversity for every site.
  * Estimates nucelotide diversity only for sites on chromosome 3
  * Filters all sites with MAF < 0.05 and creates a new vcf file.
  * Converts the filtered vcf generated in the previous step, to plink format.

**NOTE: This script runs VCF tools in a Docker container, mounting a volume and deleting it when finished running.**

### Convert .ped files to plink binary format
The `pedtobed.sh` script runs plink (assuming that the plink executable is located in the bin directory) to convert the .ped file to .bed format.

### Performing PCA
The `PCA.Rmd` contains the code necessary to perform a PCA on the data using the SNPrelate R package. After running the code on this file, an HTML report can be generated using the knit utility on RStudio. 
