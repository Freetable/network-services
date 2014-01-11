DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_email$$
CREATE PROCEDURE set_user_email (uid CHAR(36), eemail VARCHAR(96), sid CHAR(36))
  BEGIN
    UPDATE users SET email = eemail WHERE WWUSERID = uid AND sessionid = sid; 
  	SELECT 1 as result;
	END$$
  
DELIMITER ;
