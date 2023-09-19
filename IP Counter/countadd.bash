ipadd=$( bash getip.bash )
prefix=$( bash getprefix.bash )

myip1=$(echo "$ipadd" | cut -d "." -f 1)
myip2=$(echo "$ipadd" | cut -d "." -f 2)
myip3=$(echo "$ipadd" | cut -d "." -f 3)

ip1binary=$(echo "obase=2;$myip1" | bc)
ip2binary=$(echo "obase=2;$myip2" | bc)
ip3binary=$(echo "obase=2;$myip3" | bc)

ipbinary="${ip1binary} ${ip2binary} ${ip3binary} "

for ((i=1; i<255; i++)); do
	ibinary=$(echo "obase=2;$i" | bc)
	if [[ i -eq 1 ]]; then
		getzeros="0000000${ibinary}"
	elif [[ i -eq 2 ]] || [[ i -eq 3 ]]; then
		getzeros="000000${ibinary}"
	elif [[ i -ge 4 ]] && [[ i -le 7 ]]; then
		getzeros="00000${ibinary}"
	elif [[ i -ge 8 ]] && [[ i -le 15 ]]; then
		getzeros="0000${ibinary}"
	elif [[ i -ge 16 ]] && [[ i -le 31 ]]; then
		getzeros="000${ibinary}"
	elif [[ i -ge 32 ]] && [[ i -le 63 ]]; then
		getzeros="00${ibinary}"
	elif [[ i -ge 64 ]] && [[ i -le 127 ]]; then
		getzeros="0${ibinary}"
	else 
		getzeros="${ibinary}"
	fi
	echo "${ipbinary}${getzeros}/${prefix}" >> output.txt
done

