DELIMITER $$

DROP PROCEDURE IF EXISTS create_playlist$$
CREATE PROCEDURE create_playlist (uid CHAR(128), ssessionid CHAR(128), pplaylist_name VARCHAR(64))
BEGIN

SET @valid = (SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);
IF @valid > 0 THEN
	SET @last_playlist = (SELECT MAX(playlist_number)+1 FROM playlist_to_name WHERE WWUSERID = uid);
	SET @last_playlist = (IFNULL(@last_playlist,0));

	INSERT INTO playlist_to_name SET playlist_number = @last_playlist, playlist_name = pplaylist_name, WWUSERID = uid;

	SELECT @last_playlist;
END IF;
	
END$$
DELIMITER ;
