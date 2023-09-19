#! /bin/bash
# Gives network address in binary

ip=$(bash myipbinary.bash)
pl=$(bash getprefix.bash)
mask=$(bash mymaskbinary.bash)

network=""

for i in $(seq 1 32)
	do
		if [[ "${ip:i:1}" == 1 && "${mask:i:1}" == 1 ]]
		then
		network+="1"
		else
		network+="0"
		fi

done
echo "${network}"
