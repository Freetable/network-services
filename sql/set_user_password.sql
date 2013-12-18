DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_password$$

CREATE PROCEDURE set_user_password (uid CHAR(128), pass VARCHAR(128), sid CHAR(128))

BEGIN
  UPDATE users SET password = pass, sessionid = create_random_hash(128) WHERE WWUSERID = uid AND sessionid = sid;
END$$

DELIMITER ;
