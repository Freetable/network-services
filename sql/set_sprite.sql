DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_sprite$$
CREATE PROCEDURE set_sprite (uid CHAR(128), bdata BLOB, type INT UNSIGNED, sid CHAR(128))
  BEGIN
    UPDATE users SET sprite_blob = bdata, sprite_type = type WHERE WWUSERID = uid AND sessionid = sid;
  END$$
 
DELIMITER ;
