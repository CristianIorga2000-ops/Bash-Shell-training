echo For actual current disk

df -BM| awk 'NR>1 {print}' |while read line; do
	size=`echo $line| awk '{print substr( $2, 1, length($2) - 1 )}'`
        usage=`echo $line| awk '{print substr( $5, 1, length($5) - 1 )}'`
	name=`echo $line| awk '{print $1}'`
	echo -e "\n $size $usage"
	if [ $size -lt 1000 ] || [ $usage -gt 80 ]; then
		echo $name
	fi
done

echo -e "\n\n For fake disk" 
cat fake/dff.txt| awk 'NR>1 {print}' |while read line; do
        size=`echo $line| awk '{print substr( $2, 1, length($2) - 1 )}'`
        usage=`echo $line| awk '{print substr( $5, 1, length($5) - 1 )}'`
        name=`echo $line| awk '{print $1}'`
        echo -e "\n $size $usage"
        if [ $size -lt 1000 ] || [ $usage -gt 80 ]; then
                echo $name
        fi
done
~

