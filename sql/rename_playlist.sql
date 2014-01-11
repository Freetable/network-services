DELIMITER $$

DROP PROCEDURE IF EXISTS rename_playlist$$
CREATE PROCEDURE rename_playlist (uid CHAR(36), ssessionid CHAR(36), pplaylist_number INT UNSIGNED, pplaylist_name VARCHAR(64))
BEGIN

SET @valid = (SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);
IF @valid > 0 THEN
	UPDATE playlist_to_name SET playlist_name = pplaylist_name WHERE WWUSERID = uid AND playlist_number = pplaylist_number;
END IF;
	
END$$
DELIMITER ;
