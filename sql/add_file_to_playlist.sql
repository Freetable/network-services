DELIMITER $$

DROP PROCEDURE IF EXISTS add_file_to_playlist$$
CREATE PROCEDURE add_file_to_playlist (uid CHAR(36), ssessionid CHAR(36), fid CHAR(36), fn INT UNSIGNED)
BEGIN
SET @valid = ( SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);
IF @valid > 0 THEN
	SET @current_playlist = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid );
	INSERT INTO playlists SET WWFILEID = fid, WWUSERID = uid, playlist_number = @current_playlist, order_number = '-1';
	UPDATE playlists SET order_number = order_number + 1 WHERE WWUSERID = uid AND playlist_number = @current_playlist;
END IF;
	
END$$
DELIMITER ;
