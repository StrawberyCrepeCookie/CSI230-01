file=possibleips.txt

while IFS= read -r line
do
	echo "Pinging $line....."
	ping -c 1 "$line" 1>/dev/null 2>/dev/null
	SUCCESS=$?
	if [[ $SUCCESS -eq 0 ]]; then
	echo "Ping Success!"
	echo "$line" >> activehosts.txt
	else
	echo "Ping Fail...."
	fi
done < "$file"
