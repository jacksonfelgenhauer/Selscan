#./Hap.sh <HAPS>
#This QC will help in converting the phased haps file to Haplotype only (0/1) for selscan input

HAPS=$1

awk '!($1="")' $HAPS > $HAPS.tmp1.haps
awk '!($1="")' $HAPS.tmp1.haps > $HAPS.tmp2.haps
awk '!($1="")' $HAPS.tmp2.haps > $HAPS.tmp3.haps
awk '!($1="")' $HAPS.tmp3.haps > $HAPS.tmp4.haps
awk '!($1="")' $HAPS.tmp4.haps > $HAPS.final.hap

rm $HAPS.tmp1.haps
rm $HAPS.tmp2.haps
rm $HAPS.tmp3.haps
rm $HAPS.tmp4.haps

less $HAPS.final.hap | awk '{if (max_nf < NF) 
max_nf=NF 
max_nr=NR 
for (x = 1; x <= NF; x++) 
vector[x, NR] = $x
} END {
for (x=NF; x>0; x--) {
for (y=1; y<=NR; y++)
printf("%s ", vector[x, y])
print("\n")
}
}' > $HAPS.flip90.hap

grep -v -e '^$' $HAPS.flip90.hap > $HAPS.flip90.rmspace.hap

rm $HAPS.final.hap
rm $HAPS.flip90.hap

