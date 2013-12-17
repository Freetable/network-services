<<<<<<< HEAD
Freetable Network Services
==========================

Everything needed to create or rebuild a network services node.

Install Notes
=====

- cd Freetable-network-services/sql
- echo 'SOURCE install.sql;' | mysql -u root -p
- echo 'CREATE USER "ft-net-srv"@"localhost" IDENTIFIED BY "some pass";' | mysql -u root -p Freetable
- echo 'GRANT EXECUTE ON Freetable.* TO "ft-net-srv"@"localhost";'| mysql -u root -p Freetable

=========================

Technologies Used/Errata/Caveats
=======
Freetable-network-services
==========================
Everything needed to setup a Freetable network services node

cd Freetable-network-services/sql
echo 'SOURCE install.sql;' | mysql -u root -p
echo 'CREATE USER "ft-net-srv"@"localhost" IDENTIFIED BY "some pass";' | mysql -u root -p Freetable
echo 'GRANT EXECUTE ON Freetable.* TO "ft-net-srv"@"localhost";'| mysql -u root -p Freetable
=========================

Technologies Used/Errata/Caveats
================================
>>>>>>> 7e81ac3c7116dd2aa46cd9e92197db9c4ab55b07

MySql
=====
Percona:	http://www.percona.com/doc/percona-server/5.5/installation/apt_repo.html
<<<<<<< HEAD
MariaDB: https://mariadb.org/
Other DBs are not supported: PostgreSQL, MSSQL and Oracle

<!-- 
DB minimum requirements: MySql 5.5.3 (Percona)
- SHA2() functionality was added in MySQL 5.5.3, see: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html#function_sha2
-->
=======

Other DBs are not supported: PostgreSQL, MSSQL and Oracle

DB minimum requirements: MySql 5.5.3 (Percona)
- SHA2() functionality was added in MySQL 5.5.3, see: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html#function_sha2
>>>>>>> 7e81ac3c7116dd2aa46cd9e92197db9c4ab55b07

If you are getting this error:
- Thread stack overrun: ? bytes used of a ? byte stack, and 128000 bytes needed. Use 'mysqld -O thread_stack=#' to specify a bigger stack.

<<<<<<< HEAD
- Update your my.cnf (usually in /etc/mysql/) and change this line to (then /etc/init.d/mysql restart):
	thread_stack = 256M

Nginx
=====
- http://www.nginx.com/

Ruby
=====
- https://www.ruby-lang.org/en
- http://ruby.bastardsbook.com/resources/
- http://rubini.us/
- http://www.sinatrarb.com/
- http://puma.io/

Javascript
=====
- http://www.w3schools.com/js/
- http://jquery.com/
- http://www.w3schools.com/json/
- http://json.parser.online.fr/
- http://jsonlint.com/
- http://code.google.com/p/crypto-js/#SHA-2

CSS
=====
- http://getbootstrap.com/

=====================
=======
- Update your my.cbf (usually in /etc/mysql/) and change this line to (then /etc/init.d/mysql restart):
	thread_stack = 256M
=====

MongoDB/GridFS
==============
MongoDB:	http://www.mongodb.org/
GridFS:		http://learnmongo.com/posts/getting-started-with-mongodb-gridfs/
==============

Rubinius/Sinatra/Puma
=====================
Rubinius: 	http://rubini.us/
Sinatra:	http://www.sinatrarb.com/
Puma:		http://puma.io/
=====================

Nginx/Varnish
=============
Nginx:		https://www.varnish-cache.org/
Varnish:	http://php.net/

Other Webservers not supported:		Apache and IIS
Other cache servers not supported:	Squid
=============

Ruby/jQuery/Javascript/PHP
==========================
Ruby:		https://www.ruby-lang.org/en
		http://ruby.bastardsbook.com/resources/
jQuery:		http://jquery.com/
Javascript:	http://www.w3schools.com/js/
PHP:		http://php.net/
==========================

Websockets/JSON/Celluloid
=========================
Websockets:	http://www.html5rocks.com/en/tutorials/websockets/basics/
		http://socket.io/
JSON:		http://www.w3schools.com/json/
		http://json.parser.online.fr/
Celluloid:	https://github.com/celluloid/celluloid

Other data serialization formats not supported: XML
=========================
>>>>>>> 7e81ac3c7116dd2aa46cd9e92197db9c4ab55b07

