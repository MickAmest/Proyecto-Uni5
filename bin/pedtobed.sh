### Makes bed files from the VCFtools ped output
### This script asumes that the plink executable is placed in the same bin directory as the script
./plink --file ../data/wolves_maf05 --allow-extra-chr --chr-set 38 --make-bed --out ../data/wolves_maf05 
