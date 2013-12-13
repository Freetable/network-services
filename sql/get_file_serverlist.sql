DELIMITER $$

DROP PROCEDURE IF EXISTS get_file_serverlist$$
CREATE PROCEDURE get_file_serverlist(fid CHAR(128))
  BEGIN
    SELECT url from file_to_servers where WWFILEID = fid;
  END$$
  
DELIMITER ;
