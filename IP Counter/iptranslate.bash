file=output.txt

while IFS= read -r line
do
	num1=$( echo "$line" | cut -d' ' -f1 )
	num2=$( echo "$line" | cut -d' ' -f2 )
	num3=$( echo "$line" | cut -d' ' -f3 )
	num4=$( echo "$line" | cut -d' ' -f4 )
	echo "$((2#$num1)).$((2#$num2)).$((2#$num3)).$((2#$num4))" >> possibleips.txt
done < "$file"
