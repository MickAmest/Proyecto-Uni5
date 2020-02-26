### Runs vcftools on wolves example, wthin a Docker container volume
### Miguel Amaro, February 2020

## Create shortcut to run VCFtools on a Docker container and remove volume afterwards
vcftools="docker run -u 1600 --rm -v /home/cirio/miguelamaro/BioinfinvRepro/Unidad5/Proyecto-Uni5/data/VCFtools:/data biocontainers/vcftools:0.1.15 vcftools"

## Count number of samples (individuals) and SNPs the wolves file contains
$vcftools --vcf ../data/VCFtools/wolves.vcf

## Calculate allele frequencies of every individual and save output to a file
$vcftools --vcf ../data//VCFtools/wolves.vcf --freq --out ../data/VCFtools/freq_wolves.out

## Count the number of sites that do not have missing data
$vcftools --vcf ../data/VCFtools/wolves.vcf --max-missing 1.0

## Calculate allele frequencies for all sites with no missing data and write output to file
$vcftools --vcf ../data/VCFtools/wolves.vcf --max-missing 1.0 --freq --out ../data/VCFtools/frecs_nomiss

## Count the number of sites with allele frequency less than 0.05
$vcftools --vcf ../data/VCFtools/wolves.vcf --maf 0.05

## Estimate heterozigosity of every individual
$vcftools --vcf ../data/wolves.vcf --het --out ../data/hetero_wolves

## Calculate nucleotide diversity per site
$vcftools --vcf ../data/VCFtools/wolves.vcf --site-pi --out ../data/VCFtools/nuc_divers

## Calculate per-site nucleotide diversity for all sites on chromosome 3 only
$vcftools --vcf ../data/VCFtools/wolves.vcf --site-pi --chr chr03 --out ../data/VCFtools/chr3_nuc_divers

## Create new vcf file with all sites that have allele frequencies greater than 0.05
$vcftools --vcf ../data/VCFtools/wolves.vcf --maf 0.05 --recode --recode-INFO-all --out ../data/VCFtools/wolves_maf05

## Convert wolves_maf05 to plink format
mkdir ../data/plink
$vcftools --vcf ../data/VCFtools/wolves.vcf --plink --out ../data/plink/wolves_maf05
