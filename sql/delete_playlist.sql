DELIMITER $$

DROP PROCEDURE IF EXISTS delete_playlist$$
CREATE PROCEDURE delete_playlist (uid CHAR(36), ssessionid CHAR(36), pplaylist_number INT UNSIGNED)
BEGIN
SET @valid = (SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);
IF @valid > 0 THEN
	DELETE FROM playlist_to_name WHERE WWUSERID = uid AND playlist_number = pplaylist_number;
END IF;
	
END$$
DELIMITER ;
