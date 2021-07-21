
for arg
do

echo -e "\n"$arg
# isUsername takes the number of lines where the argument appears as the first column
# when the line is separated in columns by :
isUsername=`awk -F: -v r=$arg '$1 == r' /etc/passwd|wc -l`
# if isUsername is greater than 0, then we have found at least one line where the argument
# appears as an username
if [ $isUsername -gt 0 ]; then
	echo "Username"
	#A temp file to hold the last login data for our user
	last| awk -v r=$arg '$0 ~ r {print >  "tempF"; exit}'
	#isLoggedIn takes the number of lines where the user appears as being online
	isLoggedIn=0

	if [[ -f tempF ]]; then
		isLoggedIn=`grep "still logged in" tempF |wc -l`
	fi
	echo $isLoggedIn
	#if the user is logged in:
	if [ $isLoggedIn -gt 0 ]; then
		echo Logged in!
		#As name implies: this takes the number of running processes
		echo "Running processes: " `ps -u $arg|wc -l`
	#if the user is NOT logged in:
	else
		#If we have login data:
		if [[ -f tempF ]]; then
			echo Not logged in!
			ip=`awk '{print $3}' tempF`
			loginTime=`awk '{print $7}' tempF`
			duration=`awk '{print $10}' tempF`
			echo "IP: " $ip
			echo Login moment $loginTime
			echo Login duration $duration
		else
			echo No login data for this user
		fi
		
	fi
	rm tempF 2>/dev/null
fi
#if argument is file and has write and read permissions:
if [[ -f $arg ]] && [[ -w $arg ]] && [[ -r $arg ]]; then
	echo "RW file."
	#This awk command replaces all strings matching with the regex between //
	# with ERROR
	#NOTE: The regex is imperfect for this problem. It should be something like:
	#	[^-][0-9]+(.[0-9]+)?
	#	But this does not seem to actually exclude numbers preceeded by -.
	awk '{gsub(/[A-Za-z, ^][0-9]+(.[0-9]+)?/, "ERROR"); print $0 >> "tempAwk"}' $arg
	cat tempAwk > $arg
	rm tempAwk
fi
#if argument is directory:
if [[ -d $arg ]]; then
	echo "Directory."
	p="Permissions:"
	if [[ -r $arg ]]; then p="$p r"; fi
	if [[ -w $arg ]]; then p="$p w"; fi
	if [[ -x $arg ]]; then p="$p x"; fi
	echo $p

fi

done
