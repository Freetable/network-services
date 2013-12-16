DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_playlist$$
CREATE PROCEDURE get_playlist (uid CHAR(128), ssessionid CHAR(128), pplaylist_number INT UNSIGNED)
  BEGIN
    SET @valid = (SELECT COUNT(*) FROM users WHERE WWUSERID = uid AND sessionid = ssessionid);

    IF @valid > 0 THEN
      SELECT WWFILEID, order_number FROM playlists WHERE WWUSERID = uid AND playlist_number = pplaylist_number ORDER BY order_number;
    END IF; 
  END$$
 
DELIMITER ;
