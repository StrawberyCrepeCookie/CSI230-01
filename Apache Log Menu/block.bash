# block ips in blacklisted.txt

while IFS= read -r line
do
	iptables -A INPUT -s $line -j DROP
done < blacklisted.txt
