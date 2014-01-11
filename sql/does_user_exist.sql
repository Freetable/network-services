DELIMITER $$

DROP PROCEDURE IF EXISTS does_user_exist$$
CREATE PROCEDURE does_user_exist (nname VARCHAR(32), eemail VARCHAR(96))
  BEGIN
  DECLARE output;
	SET output = 0;
	IF (SELECT COUNT(*) FROM users WHERE nickname LIKE nname OR email LIKE eemail) > 0 THEN
	    IF (SELECT COUNT(*) FROM users WHERE nickname LIKE nname ) > 0 THEN SET output = output + 2; END IF;
      IF (SELECT COUNT(*) FROM users WHERE email LIKE eemail ) > 0 THEN SET output = output + 3; END IF;
			SELECT output AS 'return_code';
  ELSE
			SELECT 0 AS 'return_code';
	END IF;
  END$$
  
DELIMITER ;
