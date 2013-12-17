DELIMITER $$

DROP PROCEDURE IF EXISTS delete_user$$
CREATE PROCEDURE delete_user (uid CHAR(128), pass VARCHAR(128))
  BEGIN
<<<<<<< HEAD
    DELETE FROM users WHERE WWUSERID = uid AND password = pass; 
=======
    DELETE FROM users WHERE WWUSERID = uid AND password = SHA2(pass,512); 
>>>>>>> 7e81ac3c7116dd2aa46cd9e92197db9c4ab55b07
  END$$
  
DELIMITER ;
