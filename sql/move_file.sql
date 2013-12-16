DELIMITER $$

DROP PROCEDURE IF EXISTS move_file$$
CREATE PROCEDURE move_file (uid CHAR(128), ssessionid CHAR(128), pl_from INT UNSIGNED, pl_to INT UNSIGNED)
BEGIN
SET @valid = (SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);
IF @valid > 0 THEN
	SET @current_playlist = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid );
	UPDATE playlists SET tmp_order_number = (order_number*10)+1 WHERE WWUSERID = uid AND playlist_number = @current_playlist;
	UPDATE playlists SET tmp_order_number = (pl_to*10) WHERE WWUSERID = uid AND playlist_number = @current_playlist AND order_number = pl_from;
	SET @counter = -1;
	UPDATE playlists SET order_number = @counter := @counter + 1 WHERE WWUSERID = uid AND playlist_number = @current_playlist ORDER BY tmp_order_number;
END IF;
	
END$$
DELIMITER ;
