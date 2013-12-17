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

SQL
=====
Acceptable SQL servers:

- http://www.percona.com/doc/percona-server/5.5/installation/apt_repo.html
- https://mariadb.org/

Other DBs are not supported: PostgreSQL, MSSQL and Oracle

DB minimum requirements 
=====
- SHA2() functionality was added in MySQL 5.5.3, see: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html#function_sha2

Gotchas
======
- Thread stack overrun: ? bytes used of a ? byte stack, and 128000 bytes needed. Use 'mysqld -O thread_stack=#' to specify a bigger stack.  Update your my.cnf (usually in /etc/mysql/) and change this line to (then /etc/init.d/mysql restart):  thread_stack = 256M

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

