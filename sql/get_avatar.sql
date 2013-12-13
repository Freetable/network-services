DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_avatar$$
CREATE PROCEDURE get_avatar (uid CHAR(128))
  BEGIN
    SELECT avatar_blob, avatar_type FROM users WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
