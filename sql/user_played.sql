DELIMITER $$
DROP PROCEDURE IF EXISTS user_played$$
CREATE PROCEDURE user_played(uid CHAR(128))
  BEGIN
    SET @playlist_number = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid );
    SET @order_number = ( SELECT MAX(order_number) FROM playlists WHERE WWUSERID = uid AND playlist_number = @playlist_number );
    UPDATE playlists SET order_number = @order_number + 1 WHERE WWUSERID = uid AND playlist_number = @playlist_number AND order_number = 0;
    UPDATE playlists SET order_number = order_number - 1 WHERE WWUSERID = uid AND playlist_number = @playlist_number;
  END$$
  
DELIMITER ;
