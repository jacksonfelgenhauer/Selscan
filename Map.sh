#./Map.sh <VCF> <HAPS> <OUT>
#This command will generate the MAP file for selscan input

#Note that HAPS file is obtained after phasing
VCF=$1
HAPS=$2
OUT=$3
MAP=genetic_map_chr@.combined_b37.txt

#Extract Haps file
less $HAPS | awk '{print $2}' > $HAPS.txt

#Conversion to Map file
./plink --vcf $VCF --extract $HAPS.txt --cm-map $MAP --recode --out $OUT


