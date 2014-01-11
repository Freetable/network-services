DELIMITER $$

DROP PROCEDURE IF EXISTS verify_file_sha512$$

CREATE PROCEDURE verify_file_sha512(hash CHAR(128))
BEGIN
  IF (SELECT 1 FROM files WHERE sha512=hash) = 1 THEN 
  SELECT WWFILEID as result from files WHERE sha512=hash;
  ELSE
  SELECT '0' AS 'result';
  END IF;
  
END$$

DELIMITER ;
