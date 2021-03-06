DELIMITER $$

DROP PROCEDURE IF EXISTS get_current_file$$
CREATE PROCEDURE get_current_file (uid CHAR(36))

  BEGIN
  
    SELECT WWFILEID as result FROM playlists WHERE WWUSERID = uid AND playlist_number = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid ) AND order_number = 0;

  END$$
  
DELIMITER ;
