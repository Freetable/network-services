Freetable-network-services
==========================

Everything needed to setup a Freetable network services node

cd Freetable-network-services/sql

echo 'SOURCE install.sql;' | mysql -u root -p
echo 'CREATE USER "ft-net-srv"@"localhost" IDENTIFIED BY "some pass";' | mysql -u root -p Freetable
echo 'GRANT EXECUTE ON Freetable.* TO "ft-net-srv"@"localhost";'| mysql -u root -p Freetable


