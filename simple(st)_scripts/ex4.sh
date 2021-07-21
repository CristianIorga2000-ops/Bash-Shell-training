dir="fake/dir/"
if [ $# -gt 0 ]; then dir=$1; fi
find $dir -xtype l
	
