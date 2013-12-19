DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_last_name$$
CREATE PROCEDURE set_user_last_name (uid CHAR(128), llast_name VARCHAR(32), sid CHAR(128))
  BEGIN
    UPDATE users SET last_name = llast_name WHERE WWUSERID = uid AND sessionid = sid; 
  END$$
  
DELIMITER ;
