DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_password$$

CREATE PROCEDURE set_user_password (uid CHAR(128), pass VARCHAR(128))

BEGIN
<<<<<<< HEAD
  UPDATE users SET password = pass WHERE WWUSERID = uid;
=======
  UPDATE users SET password = SHA2(pass,512) WHERE WWUSERID = uid;
>>>>>>> 7e81ac3c7116dd2aa46cd9e92197db9c4ab55b07
END$$

DELIMITER ;
