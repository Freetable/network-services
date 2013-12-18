DELIMITER $$

DROP PROCEDURE IF EXISTS recover_user$$
CREATE PROCEDURE recover_user (search VARCHAR(96))
  BEGIN
		IF (SELECT COUNT(*) FROM users WHERE email LIKE search OR nickname LIKE search) > 0 THEN
    UPDATE users SET sessionid = create_random_hash(128) WHERE email LIKE search OR nickname LIKE search;
    SELECT WWUSERID, sessionid, first_name, last_name, nickname, email FROM users WHERE email LIKE search OR nickname LIKE search;
		END IF;
  END$$
  
DELIMITER ;
