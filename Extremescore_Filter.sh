
Pop=$1
for i in {1..22}
do
less $Pop.$i.xpehh.out.norm | sed '1d' | awk '{if($9>=2) print '$i',$1,$2,$9}' > Extreme/$Pop.$i.extreme
done

cd Extreme

cat $Pop.*.extreme > $Pop.1-22.extreme.txt
