#! /bin/bash
# gives subnetmask in binary

pl=$(bash getprefix.bash)

submask=""
for i in $(seq 1 32)
	do
		if [[ "${i}" -le "${pl}" ]]; 
		then 
			submask+="1"
		else
			submask+="0"
		fi
	done

echo "${submask}"
