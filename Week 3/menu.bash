loop=1

while [ $loop == 1 ]
do
echo "Please select an opption:"
echo "1. Get my ip address"
echo "2. Get my ip address in binary"
echo "3. Get my network mask in binary"
echo "4. Get my network address in binary"
echo "5. Convert binary to IP address"
echo "6. Quit\n:::"

read choice

case $choice in 
	1) 
		bash getip.bash
	;;
	2)
		bash myipbinary.bash
	;;
	3)
		bash mymaskbinary.bash
	;;
	4)
		bash mynetworkbinary.bash
	;;
	5)
		bash convbin2ip.bash
	;;
	6)
		loop=0
	;;
	*)
		echo "Invalid  input"
	;;
esac
done
