Help(){
echo "---------------------------------"
echo "Syntax: ./$0 arg1"
echo "-d will list disabled accounts"
echo "-c will count logins of a user"
echo "h will print help"
echo "---------------------------------"
}

disabledAccounts(){
dis=$(cat /etc/shadow | grep -v "nologin" |  grep "*" | sort)
echo "$dis"
}

userLogins(){
while IFS= read -r line
do
his=$(last $line | wc -l)
echo "$line: $his"
done < "usr.txt"
}

if [ ! ${#} -ge 1 ]; then
Help
exit;
fi


while getopts ":dc" option; do
	case $option in
	d) # List disabled accounts
	echo "Disabled Accounts: "
	disabledAccounts
	;;
	c) # Count logins of a user
	echo "User Logins: "
	userLogins
	;;
	*) # Help
	Help
	;;
	esac
done
