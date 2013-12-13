DELIMITER $$

DROP PROCEDURE IF EXISTS delete_server_from_file_list$$
CREATE PROCEDURE delete_server_from_file_list(fid CHAR(128), uurl VARCHAR(384))
  BEGIN
    DELETE FROM file_to_servers WHERE WWFIELDID = fid AND url = uurl;
  END$$
  
DELIMITER ;
