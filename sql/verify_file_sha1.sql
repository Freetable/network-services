DELIMITER $$

DROP PROCEDURE IF EXISTS verify_file_sha1$$

CREATE PROCEDURE verify_file_sha1(hash CHAR(160))
BEGIN
  IF (SELECT 1 FROM files WHERE sha1=hash) = 1 THEN 
  SELECT WWFILEID as result FROM files WHERE sha1=hash;
  ELSE
  SELECT '0' AS 'result';
  END IF;
  
END$$

DELIMITER ;
