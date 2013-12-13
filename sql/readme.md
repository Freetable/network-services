This repository is everything needed to get the network services SQL database created, online and ready to join the group.

Please make sure to backup your database before installing this script:

mysqldump -u root -p Freetable | gzip -c - >  Freetable-`date +%s`.sql.gz

To install, use something like the mysql client:

cat install.sql | mysql -u root -p

