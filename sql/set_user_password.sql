DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_password$$

CREATE PROCEDURE set_user_password (uid CHAR(128), pass VARCHAR(128))

BEGIN
  UPDATE users SET password = SHA2(pass,512) WHERE WWUSERID = uid;
END$$

DELIMITER ;
