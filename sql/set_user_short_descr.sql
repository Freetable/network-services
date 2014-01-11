DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_short_descr$$
CREATE PROCEDURE set_user_short_descr (uid CHAR(36), sshort_descr VARCHAR(1024), sid CHAR(36))
  BEGIN
    UPDATE users SET short_description = sshort_descr WHERE WWUSERID = uid AND sessionid = sid; 
		SELECT 1 as result;
  END$$
  
DELIMITER ;
