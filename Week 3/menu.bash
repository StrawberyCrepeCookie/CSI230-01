loop=1

while [ $loop == 1 ]
do
echo "Please select an opption:"
echo "1. Get my ip address"
echo "2. Get my ip address in binary"
echo "3. Get my network mask in binary"
echo "4. Get my network address in binary"
echo "5. Convert binary to IP address"
echo "6. Quit"

read choice

case $choice in 
	1)
		echo "Your IP: "
		bash getip.bash
	;;
	2)
		echo "Your IP in binary: "
		bash myipbinary.bash
	;;
	3)
		echo "Your network mask in binary: "
		bash mymaskbinary.bash
	;;
	4)
		echo "Your network address in binary: "
		bash mynetworkbinary.bash
	;;
	5)
		bash convbin2ip.bash
	;;
	6)
		echo "Exiting...."
		loop=0
	;;
	*)
		echo "Invalid  input"
	;;
esac
done
