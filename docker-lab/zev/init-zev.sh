#!/bin/bash

# amend the home directory for mysql user to /var/lib/mysql/
#avoids an error 
usermod -d /var/lib/mysql/ mysql

# Start MySQL service
service mysql start

# Securing the installation
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

#read the subi example database
printf "Reading subi example database file %s into the database \n" "$SUBI_DATABASE_FILE" 
mysql -uroot -p${MYSQL_ROOT_PASSWORD} < ${SUBI_DATABASE_FILE} 

printf "##########################lexx-zev hints#####################################\n"
printf "you can connect to the lexx-zev database and dump the database using command: \n"
printf "docker exec -i lexx-zev mysql -u root -prootpassword -e \"SELECT * FROM subi.connections;\" \n"
printf "##############################################################################\n"


# Keep the container running
tail -f /dev/null
