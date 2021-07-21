echo General solution 1

for user in `who| awk '{print $1}'|sort|uniq`; do
echo $user `pgrep -l -u $user|wc -l`
done

echo -e "\nGeneral solution 2"

for user in `who| awk '{print $1}'|sort|uniq`; do
echo $user `ps -u $user|awk 'NR>1{print}'|wc -l`
done

echo -e "\nSolution for /fake files"
for user in `awk '{print $1}' fake/whof.txt`; do
echo $user `awk -v r=$user '$1 ~ r {print}' fake/psf.txt| wc -l`
done
