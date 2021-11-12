#Use script: ./iHS.sh [hap file] [map file] [output file] 
#Input file extension (.treemix.frq.gz)

HAP=$1
MAP=$2
OUT=$3

./selscan --ihs --hap $HAP --map $MAP --threads 4 --out $OUT
./norm --ihs --files $OUT --bp-win

