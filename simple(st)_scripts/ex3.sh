directory="fake/dir"
if [ $# -gt 0 ]; then  directory=$1; fi

for file in `find $directory -name "*.log"`; do
	sort $file > temp
	cat temp > $file
done
rm temp

