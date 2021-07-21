count=0
directory="fake/dir/"
if [ $# -gt 0 ]; then directory=$1; fi
echo Searching in: $directory ... 	

for filename in `find $directory  -name "*.c"`; do
	if [ `cat $filename|wc -l` -gt 499 ]; then
		((count++))
		if [ $count -gt 2 ]; then break; fi
		echo $filename
	fi
done
