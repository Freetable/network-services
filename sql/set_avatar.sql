DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_avatar$$
CREATE PROCEDURE set_avatar (uid CHAR(36), bdata BLOB, type INT UNSIGNED, sid CHAR(36))
  BEGIN
    UPDATE users SET avatar_blob = bdata, avatar_type = type WHERE WWUSERID = uid AND sessionid = sid;
  END$$
 
DELIMITER ;
