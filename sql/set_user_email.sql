DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_email$$
CREATE PROCEDURE set_user_email (uid CHAR(128), eemail VARCHAR(96), sid CHAR(128))
  BEGIN
    UPDATE users SET email = eemail WHERE WWUSERID = uid AND sessionid = sid; 
  END$$
  
DELIMITER ;
