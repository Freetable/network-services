DELIMITER $$

DROP PROCEDURE IF EXISTS query_user$$
CREATE PROCEDURE query_user (uid CHAR(128))
  BEGIN
    SELECT email, nickname, first_name, last_name, short_description, long_description FROM users WHERE WWUSERID = uid;
  END$$
  
DELIMITER ;
