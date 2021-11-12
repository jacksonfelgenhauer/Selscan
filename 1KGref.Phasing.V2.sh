#!/bin/bash

shopt -s nullglob

#To run the script ./1KGref.Phasing.V2.sh [VCF FILE NAME] [CHR_NUMBER]

VCF=$1
CHR=$2

echo "VCF: $VCF" > /dev/stderr
echo "CHR: $CHR" > /dev/stderr

#REF_DIR is the location of reference panels, REF_PANEL must specify the hap,legend and sample, MAP consist of the genetic map
REF_DIR=/mnt/storage/subuser1/user2/alvin/Imputation/IMPUTATION_AND_PHASING/TESTRUNIMPUTESCRIPT/REFPANELS
REF_PANEL="$REF_DIR/1000GP_Phase3_chr$CHR.hap.gz $REF_DIR/1000GP_Phase3_chr$CHR.legend.gz $REF_DIR/1000GP_Phase3.sample"
MAP=$REF_DIR/genetic_map_chr$CHR.combined_b37.txt

./shapeit \
-V $VCF.vcf \
-M $MAP \
--input-ref $REF_PANEL \
-O $VCF.phased

#Credit: Alvin Cengnata
