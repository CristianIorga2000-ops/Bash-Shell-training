pattern=$1
replace=$2
for file in ./*; do
	if [[ $file == *"$pattern"* ]]; then
		echo $file
		if [ $# -eq 2 ]; then
			newFileName="${file/$pattern/$replace}"
			cat $file > $newFileName
			chmod 700 $newFileName	
		fi
		rm -r $file;
	fi
done
