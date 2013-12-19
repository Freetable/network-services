DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_first_name$$
CREATE PROCEDURE set_user_first_name (uid CHAR(128), ffirst_name VARCHAR(32), sid CHAR(128))
  BEGIN
    UPDATE users SET first_name = ffirst_name WHERE WWUSERID = uid AND sessionid = sid; 
  END$$
  
DELIMITER ;
