DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_sprite$$
CREATE PROCEDURE get_sprite (uid CHAR(128))
  BEGIN
    SELECT sprite_blob, sprite_type FROM users WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
