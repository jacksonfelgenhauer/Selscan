#Top3%
Pop=$1

for i in {1..22}
do
less $Pop.$i.*.windows | awk '{if($4>=0 && $3>=10) print '$i',$1,$2,$3,$4}' > Filtered/$Pop.$i.100kb.filtered
done

cd Filtered/

cat $Pop.*.filtered > $Pop.1-22.filtered

less $Pop.1-22.filtered | sort -k5 -nr > $Pop.sorted

less $Pop.sorted | head -700 > $Pop.Top3.txt
