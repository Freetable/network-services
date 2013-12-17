DELIMITER $$

DROP PROCEDURE IF EXISTS delete_user$$
CREATE PROCEDURE delete_user (uid CHAR(128), pass VARCHAR(128))
  BEGIN
    DELETE FROM users WHERE WWUSERID = uid AND password = pass; 
  END$$
  
DELIMITER ;
