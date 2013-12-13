DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_long_descr$$
CREATE PROCEDURE set_user_long_descr (uid CHAR(128), llong_description TEXT)
  BEGIN
    UPDATE users SET long_description = llong_description WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
