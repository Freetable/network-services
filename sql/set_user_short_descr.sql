DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_short_descr$$
CREATE PROCEDURE set_user_short_descr (uid CHAR(128), sshort_descr VARCHAR(1024), sid CHAR(128))
  BEGIN
    UPDATE users SET short_description = sshort_descr WHERE WWUSERID = uid AND sessionid = sid; 
  END$$
  
DELIMITER ;
