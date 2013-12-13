DELIMITER $$

DROP PROCEDURE IF EXISTS verify_user$$

CREATE PROCEDURE verify_user(uid CHAR(128), ssessionid CHAR(128))
BEGIN
  IF (SELECT 1 FROM users WHERE WWUSERID = uid AND sessionid = ssessionid) = 1 THEN 
  SELECT '1';
  ELSE
  SELECT '0';
  END IF;
  
END$$

DELIMITER ;
