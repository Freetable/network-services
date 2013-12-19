DELIMITER $$

DROP PROCEDURE IF EXISTS invalidate_user$$

CREATE PROCEDURE invalidate_user (uid CHAR(128))

BEGIN
    UPDATE users SET sessionid = create_random_hash(128) WHERE WWUSERID = uid;
END$$

DELIMITER ;
