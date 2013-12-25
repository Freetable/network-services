DELIMITER $$

DROP PROCEDURE IF EXISTS verify_file_md5$$

CREATE PROCEDURE verify_file_md5(hash CHAR(32))
BEGIN
  IF (SELECT 1 FROM files WHERE md5=hash) = 1 THEN 
  SELECT '1';
  ELSE
  SELECT '0';
  END IF;
  
END$$

DELIMITER ;
