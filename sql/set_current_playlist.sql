DELIMITER $$

DROP PROCEDURE IF EXISTS set_current_playlist$$
CREATE PROCEDURE set_current_playlist (uid CHAR(36), ssessionid CHAR(36), pplaylist_number INT UNSIGNED)
  BEGIN
	SET @valid = (SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);

	IF @valid > 0 THEN
          INSERT users_current_playlist SET playlist_number = pplaylist_number, WWUSERID = uid ON DUPLICATE KEY UPDATE playlist_number = pplaylist_number;
	END IF;
  END$$
  
DELIMITER ;
