n=3
re='^ *[0-9]+ *'
sum=0
count=0
emails=""
forks=0
while(( n>0 ))
do
	read input
	if [[ "$input" =~ $re ]] 2>/dev/null
	then
		((sum = sum+$input))
		((count++))
		echo "Number"
	fi
	if [[ -f "$input" ]] 
	then
		echo "Filename"
		(( n-- ))
		rex='.c *$'	
		if [[ "$input" =~ $rex ]] 
		then
			echo "C file"
			((forks = forks + `tr ";" "\n" < $input|awk '$0 ~ /fork()/'|wc -l`))
			
		fi
	fi
	isUser=`awk -F: -v r=$input '$1 == r' /etc/passwd| wc -l`
	if [ $isUser -gt 0 ]
	then
		emails="$emails, <$incput@scs.ubbcluj.ro>"
		echo "Username"		
	fi

done

if [ $count -eq 0 ]
then
	count=1
fi

echo `echo $emails | awk '{print substr($0, 3)}' ` >emails.txt
avg=`echo "$sum/$count" |bc`
echo "Average of all numbers is: " $avg
echo "Total forks()= " $forks
