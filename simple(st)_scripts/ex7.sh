awk -F: '{print $1}' fake/passwdf.txt > temp
usernames="temp"
if [ $# -gt 0 ]; then usernames=$1; fi

emailList=""
while read user; do
	emailList="$emailList, $user@scs.ubbcluj.ro"
done < $usernames

rm temp
echo $emailList
