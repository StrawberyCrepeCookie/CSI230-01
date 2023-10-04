file=possibleips.txt
printf "" > detectedservers.txt
while IFS= read -r line
do
        echo "Pinging $line....."
        curl --head  "$line/helloworld.html"
	SUCCESS=$?
	if [[ $SUCCESS -eq 0 ]]; then
	echo "$line" >> detectedservers.txt
	fi
done < "$file"
