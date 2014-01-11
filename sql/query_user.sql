DELIMITER $$

DROP PROCEDURE IF EXISTS query_user$$
CREATE PROCEDURE query_user (uid CHAR(36))
  BEGIN
    SELECT nickname as result FROM users WHERE WWUSERID = uid;
  END$$
  
DELIMITER ;
