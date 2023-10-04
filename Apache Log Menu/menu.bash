# Menu for the Apache Log Menu assignemnt
#--------------------------------------------------------------------------------------------------
listips() {
#Make a list of all IP Addresses, excluding 127.0.0.1, that has accessed my web page
printf "" > clientIPs.txt

IP=$( cat /var/log/apache2/access.log | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq )
echo "$IP" >> clientIPs.txt
}

#--------------------------------------------------------------------------------------------------
visitors() {
# Go over clientIPs.txt in a loop and count how many tims they have accessed the website whithin the last day
fulldate=$(date +"%d/%b/%Y")

access=$( cat /var/log/apache2/access.log | grep "$fulldate" | cut -d' ' -f 1 | sort | uniq -c)
echo "$access"
}
#--------------------------------------------------------------------------------------------------
badclients() {
# Count how many times an ip intruded me in the last hour then blacklist them
datetime=$(date +"%d/%b/%Y:%H")
printf "" > blacklisted.txt
while IFS= read -r line
do
        # culprit=$(cat /var/log/apache2/access.log | grep -E "$line | $(date -d '1 hour ago +%d/%b/%Y:%H) | (404|400|403>
        culprit=$(cat /var/log/apache2/access.log | grep -E "$line|$datetime" | cut -d' ' -f 9 | sort | uniq -c)
        count=$( echo $culprit | grep -E "(400|404|403)" | cut -d' ' -f 1)
        if [ $count -gt 3 ]; then
        echo "$line" >> blacklisted.txt
        fi
done < clientIPs.txt
}
#--------------------------------------------------------------------------------------------------
histogram() {
# Show how many 200 OK requests were recived by clients each day
# i really have no idea what to do from here, I give up

var=$(awk '{print $4,$9}' /var/log/apache2/access.log | sort | uniq -c)
echo "$var"
}
#--------------------------------------------------------------------------------------------------
block() {
# block ips in blacklisted.txt

while IFS= read -r line
do
        iptables -A INPUT -s $line -j DROP
done < blacklisted.txt
}
#--------------------------------------------------------------------------------------------------
resetblocks() {
#reset all ip blocks

iptables -F
}
#--------------------------------------------------------------------------------------------------
# Menu
while true; do
echo "What would you like to do?"
echo "1. Number Of Visitors"
echo "2. Display Visitors"
echo "3. Show bad Visits"
echo "4. Block Bad Visits"
echo "5. Reset Block Rules"
echo "6. Show Visit Histogram"
echo "7. Quit"
read input

case $input in
	"1") 
	listips
	count=0
	while IFS= read -r line
	do
		((count++))
	done < clientIPs.txt
	echo "Number of Visitors: $count"
	;;
	"2")
	visitors
	;;
	"3")
	badclients
	while IFS= read -r line
	do
		echo "$line"
	done < blacklisted.txt
	;;
	"4")
	block
	iptables -L INPUT -v -n
	;;
	"5")
	resetblocks
	iptables -L INPUT -v -n
	;;
	"6")
	histogram
	;;
	"7")
	exit
	;;
	*)
	echo "Invalid Input"
	;;
esac
done
