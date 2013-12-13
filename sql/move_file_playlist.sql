DELIMITER $$

DROP PROCEDURE IF EXISTS move_file_playlist$$
CREATE PROCEDURE move_file_playlist (uid CHAR(128), ssessionid CHAR(128), fid CHAR(128), pl_from INT UNSIGNED, pl_to INT UNSIGNED)
BEGIN
SET @valid = (SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);
IF @valid > 0 THEN
	SET @current_playlist = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid );
	UPDATE playlists SET order_number=-1, playlist_number=pl_to WHERE WWUSERID = uid AND WWFILEID = fid AND playlist_number = pl_from;

 	-- Refactor the to table

	UPDATE playlists SET tmp_order_number = order_number WHERE WWUSERID = uid AND playlist_number = pl_to;
	SET @counter = -1;
	UPDATE playlists SET order_number = @counter := @counter + 1 WHERE WWUSERID = uid AND playlist_number = pl_to ORDER BY tmp_order_number;

	-- Refactor the old table

        UPDATE playlists SET tmp_order_number = order_number WHERE WWUSERID = uid AND playlist_number = pl_from;
        SET @counter = -1;
        UPDATE playlists SET order_number = @counter := @counter + 1 WHERE WWUSERID = uid AND playlist_number = pl_from ORDER BY tmp_order_number;
END IF;
	
END$$
DELIMITER ;
