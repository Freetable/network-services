DELIMITER $$

DROP PROCEDURE IF EXISTS add_server_to_filelist$$
CREATE PROCEDURE add_server_to_filelist(fid CHAR(128), uurl VARCHAR(384))
  BEGIN

    INSERT into file_to_servers SET WWFILEID = fid, url = uurl, last_verified = NOW();

  END$$
  
DELIMITER ;
