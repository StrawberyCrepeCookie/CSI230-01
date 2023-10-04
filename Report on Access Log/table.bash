echo "<!DOCTYPE html>" > table.html
echo "<html>" >> table.html

echo "<style>" >> table.html
echo "table, th, td {border:1px solid black;}" >> table.html
echo "</style>" >> table.html

echo "<body>" >> table.html
echo "<table style='width:100%'>" >> table.html
echo "<tr>" >> table.html
	echo "<th>IP</th>" >> table.html
	echo "<th>Time</th>" >> table.html
	echo "<th>RequestedPage</th>" >> table.html
	echo "<th>UserAgent</th>" >> table.html
echo "</tr>" >> table.html
#------------------------------------------------ now i need to fill the rows
while IFS= read -r line
do
echo "<tr>" >> table.html
	ip=$(echo -s $line | cut -d' ' -f 2)
	echo "<td>$ip</td>" >> table.html
	timee=$(echo -s $line | cut -d' ' -f 5 | tr -d [)
	echo "<td>$timee</td>" >> table.html
	page=$(echo -s $line | cut -d' ' -f 8)
	echo "<td>$page</td>" >> table.html
	agent=$(echo -s $line | cut -d' ' -f 13)
	echo "<td>$agent</td>" >> table.html
echo "</tr>" >> table.html
done < access.txt
echo "</table>" >> table.html
echo "</body>" >> table.html

echo "</html>" >> table.html

bash makehtml.bash
echo "Complete"
