DELIMITER $$

DROP PROCEDURE IF EXISTS recover_password$$
CREATE PROCEDURE recover_password (search VARCHAR(96))
  BEGIN
		IF (SELECT COUNT(*) FROM users WHERE email LIKE search OR nickname LIKE search) > 0 THEN
    UPDATE users SET sessionid = UUID() WHERE email LIKE search OR nickname LIKE search;
    SELECT WWUSERID, sessionid, first_name, last_name, nickname, email FROM users WHERE email LIKE search OR nickname LIKE search;
		END IF;
  END$$
  
DELIMITER ;
