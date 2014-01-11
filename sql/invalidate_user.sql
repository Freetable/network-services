DELIMITER $$

DROP PROCEDURE IF EXISTS invalidate_user$$

CREATE PROCEDURE invalidate_user (uid CHAR(36))

BEGIN
    UPDATE users SET sessionid = UUID() WHERE WWUSERID = uid;
END$$

DELIMITER ;
