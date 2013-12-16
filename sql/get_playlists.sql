DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_playlists$$
CREATE PROCEDURE get_playlists (uid CHAR(128), ssessionid CHAR(128))
  BEGIN
SET @valid = (SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);
IF @valid > 0 THEN
    SELECT playlist_number, playlist_name from playlist_to_name WHERE WWUSERID = uid ORDER BY playlist_number;
END IF; 
  END$$
 
DELIMITER ;
