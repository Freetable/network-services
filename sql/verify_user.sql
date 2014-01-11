DELIMITER $$

DROP PROCEDURE IF EXISTS verify_user$$

CREATE PROCEDURE verify_user(uid CHAR(36), ssessionid CHAR(36))
BEGIN
  IF (SELECT 1 FROM users WHERE WWUSERID = uid AND sessionid = ssessionid) = 1 THEN 
  SELECT '1' as result;
  ELSE
  SELECT '0' as result;
  END IF;
  
END$$

DELIMITER ;
