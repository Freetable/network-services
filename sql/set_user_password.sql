DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_password$$

CREATE PROCEDURE set_user_password (uid CHAR(36), pass VARCHAR(128), sid CHAR(36))

BEGIN
  UPDATE users SET password = pass, sessionid = UUID() WHERE WWUSERID = uid AND sessionid = sid;
	SELECT 1 as result;
END$$

DELIMITER ;
