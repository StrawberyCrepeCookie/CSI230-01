# Count how many times an ip intruded me in the last hour then blacklist them
datetime=$(date +"%d/%b/%Y:%H")

while IFS= read -r line
do
	# culprit=$(cat /var/log/apache2/access.log | grep -E "$line | $(date -d '1 hour ago +%d/%b/%Y:%H) | (404|400|403) | sort | uniq -c)
	culprit=$(cat /var/log/apache2/access.log | grep -E "$line|$datetime" | cut -d' ' -f 9 | sort | uniq -c)
	count=$( echo $culprit | grep -E "(400|404|403)" | cut -d' ' -f 1)
	if [ $count -gt 3 ]; then
	echo "$line" >> blacklisted.txt
	fi
done < clientIPs.txt
