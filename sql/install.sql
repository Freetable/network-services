DROP DATABASE IF EXISTS Freetable;
CREATE DATABASE IF NOT EXISTS Freetable DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

source freetable_network_services.sql;
source sp_update.sql;
