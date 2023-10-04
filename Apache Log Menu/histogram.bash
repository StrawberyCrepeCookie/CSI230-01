# Show how many 200 OK requests were recived by clients each day
# i really have no idea what to do from here, I give up

var=$(awk '{print $4,$9}' /var/log/apache2/access.log | sort | uniq -c)
