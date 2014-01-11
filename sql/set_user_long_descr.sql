DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_long_descr$$
CREATE PROCEDURE set_user_long_descr (uid CHAR(36), llong_description TEXT, sid CHAR(36))
  BEGIN
    UPDATE users SET long_description = llong_description WHERE WWUSERID = uid AND sessionid = sid; 
		SELECT 1 as result;
  END$$
  
DELIMITER ;
