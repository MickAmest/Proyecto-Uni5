### Get vcf data from Dryad repository and save then to data directory
### Miguel Amaro, Feb 2020

cd ../
mkdir data
mkdir data/VCFtools
cd data/VCFtools
wget https://datadryad.org/stash/downloads/file_stream/6226
mv 6226 wolves.vcf
