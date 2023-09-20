NA="192.168.3.42"
count=0

for (( i=1; i<=20; i++ )); do
	if [[ $(curl -s --head "${NA}/helloworld.html" | grep "200") ]]
	then
		count=$((count+1))
	fi
done

echo "Times intruded: ${count}"
