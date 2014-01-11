DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_last_name$$
CREATE PROCEDURE set_user_last_name (uid CHAR(36), llast_name VARCHAR(32), sid CHAR(36))
  BEGIN
    UPDATE users SET last_name = llast_name WHERE WWUSERID = uid AND sessionid = sid; 
		SELECT 1 as result;
  END$$
  
DELIMITER ;
