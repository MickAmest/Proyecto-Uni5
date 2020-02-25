### Plotting a Site Frequency Spectrum from the VCFtools allele frequency output
### Miguel Amaro, Feb 2020

library(tidyr)
library(ggplot2)

## Load data
freqs <- read.delim(file = "../data/freq_wolves.out.frq", row.names = NULL)
## Separate X.ALLELE.FREQ. column into two separate columns (so we can plot the frequency values)
freqs_clean <- freqs %>% separate("X.ALLELE.FREQ.", c("Allele", "Freq"), sep = ":")
write.table(freqs_clean, row.names = FALSE, file = "../data/freqs_clean")

## Plot allele frequencies for all sites (SFS)
ggplot(freqs_clean, aes(as.numeric(freqs_clean$Freq))) + # Read data as numeric, since they are in a DF, they are read as character by default
  geom_histogram(binwidth = 0.05) +
  labs(x="Frecuencia de los alelos", y="Número de SNP's") +
  ggtitle("Site frequency Spectrum (SFS)") +
  theme(plot.title = element_text(hjust = 0.5)) 
       