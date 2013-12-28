DELIMITER $$

DROP PROCEDURE IF EXISTS does_user_exist$$
CREATE PROCEDURE does_user_exist (nname VARCHAR(32), eemail VARCHAR(96))
  BEGIN
	IF (SELECT COUNT(*) FROM users WHERE nickname LIKE nname OR email LIKE eemail) > 0 THEN
	    SELECT 1;
  ELSE
			SELECT 0;
	END IF;
  END$$
  
DELIMITER ;
