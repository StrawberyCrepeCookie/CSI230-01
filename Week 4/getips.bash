# Help

month=$( date | cut -d' ' -f2)
day=$( date | cut -d' ' -f3)
year=$( date | cut -d' ' -f7)

fulldate="$day/$month/$year"

# old ver:::access=$(cat /var/log/apache2/access.log | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c)

access=$(cat /var/log/apache2/access.log | grep $fulldate |cut -d' ' -f1 |  sort | uniq -c)
echo "$access"
