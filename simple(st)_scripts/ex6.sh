dir="fake/dir/"
if [ $# -gt 0 ]; then dir=$1; fi

find $dir -ls| while read file; do
	echo $file
	permissions=`echo $file| awk '{print $3}'`
	filename=`echo $file| awk '{print $11}'`
	if [[ -w $filename ]] && [[ -f $filename ]]; then
		echo -e "\n$permissions $filename"
		chmod 555 $filename
		newPermissions=`echo $permissions| tr w -`
		echo $newPermissions $filename
	fi
done
