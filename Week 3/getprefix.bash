# Gets the IP address in full from getfullip.bash as x.x.x.x/x
# Returns the IP address as just the /x

ip=$(bash getfullip.bash | cut -d "/" -f 2)
echo "${ip}"
