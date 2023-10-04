# Make a list of all IP Addresses, excluding 127.0.0.1, that has accessed my web page
printf "" > clientIPs.txt

IP=$( cat /var/log/apache2/access.log | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq )
echo "$IP" >> clientIPs.txt
