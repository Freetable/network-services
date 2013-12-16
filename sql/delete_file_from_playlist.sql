DELIMITER $$

DROP PROCEDURE IF EXISTS delete_file_from_playlist$$
CREATE PROCEDURE delete_file_from_playlist (uid CHAR(128), ssessionid CHAR(128), fid CHAR(128))
BEGIN
SET @valid = (SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);
IF @valid > 0 THEN
	SET @current_playlist = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid );
	DELETE FROM playlists WHERE WWFILEID = fid AND WWUSERID = uid AND playlist_number = @current_playlist;
END IF;
	
END$$
DELIMITER ;
