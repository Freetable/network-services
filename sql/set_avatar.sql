DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_avatar$$
CREATE PROCEDURE set_avatar (uid CHAR(128), bdata BLOB, type INT UNSIGNED)
  BEGIN
    UPDATE users SET avatar_blob = bdata, avatar_type = type WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
