#Use script: ./XPEHH.sh [hap file] [ref file] [map file] [output file] 
#Input file extension (.treemix.frq.gz)

HAP=$1
REF=$2
MAP=$3
OUT=$4

./selscan --xpehh --hap $HAP --ref $REF --map $MAP --threads 4 --out $OUT
./norm --xpehh --files $OUT --bp-win

