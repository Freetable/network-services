DELIMITER $$

DROP PROCEDURE IF EXISTS get_file_serverlist$$
CREATE PROCEDURE get_file_serverlist(fid CHAR(36))
  BEGIN
    SELECT url as result from file_to_servers where WWFILEID = fid;
  END$$
  
DELIMITER ;
