month=$( date | cut -d' ' -f2)
day=$( date | cut -d' ' -f3)
year=$( date | cut -d' ' -f7)
echo "$month"
echo "$day"
echo "$year"

fullDate="$day/$month/$year"
echo "$fullDate"
