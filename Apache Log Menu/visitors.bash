# Go over clientIPs.txt in a loop and count how many tims they have accessed the website whithin the last day
fulldate=$(date +"%d/%b/%Y")

access=$( cat /var/log/apache2/access.log | grep "$fulldate" | cut -d' ' -f 1 | sort | uniq -c)
echo "$access"
