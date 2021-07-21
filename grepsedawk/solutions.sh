echo Exercise 1
grep "economica" fake/lastf | awk  '$0 ~ /Sun/ {print $1}'| sort| uniq

echo -e "\nExercise 2"
awk '$7 ~ /23:/ {print $1}' fake/lastf|sort|uniq

echo -e "\nExercise 3"
awk -F: '$1 ~ /^m/ && $3 % 7 == 0 {print $5}' fake/passwd | sort|uniq

echo -e "\nExercise 4"
awk '$1 ~ /root/ {print $6}' fake/psf| sort| uniq

echo -e "\nExercise 5"
awk -F: '$1 ~ /88$/ {print$5}' fake/passwd | sort| uniq

echo -e "\nExercise 6"
awk -F: '$3 ~ /23[0-9]/ {print $5}' fake/passwd | sort| uniq

echo -e "\nExercise 7"
awk '$1 ~ /^t/ && $2 ~ /pts\/9/ {print $1}' fake/lastf|sort|uniq

echo -e "\nExercise 8"
awk '$1 ~ /^r/ {print $1}' fake/psf | sort| uniq| awk '{gsub(/a/, "aa"); gsub(/e/, "ee"); gsub(/i/, "ii"); gsub(/o/, "oo"); gsub(/u/, "uu"); print $0}'

echo -e "\nExercise 9"
awk '{gsub(/[a-zA-Z0-9 ]/, "") ;print $0}' fake/passwd | sort| uniq

echo -e "\nExercise 10"
awk '{gsub(/[^r]/, "") ;print $0}' fake/passwd | sort| uniq

echo -e "\nExercise 11"
awk 'BEGIN{nrproc=0; sum=0;}{nrproc++; sum += $2;} END{print sum/nrproc} '  fake/psf

