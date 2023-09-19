echo "Enter binary ip: "
read ip

realip=$(echo "ibase=2; $ip" | bc)

part1=$((realip >> 24 & 255))
part2=$((realip >> 16 & 255))
part3=$((realip >> 8 & 255))
part4=$((realip & 255))

ipaddress="$part1.$part2.$part3.$part4"
echo "IP address:: $ipaddress"
