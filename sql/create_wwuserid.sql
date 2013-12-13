-- MUST WRITE LOCK USERS BEFORE ISSUING THIS COMMAND!

DELIMITER $$

DROP PROCEDURE IF EXISTS create_wwuserid$$
CREATE PROCEDURE create_wwuserid ()

  BEGIN
  
  DECLARE output VARCHAR(128);
  DECLARE done_bool BOOL;
  DECLARE count_test INT UNSIGNED;
  
  SET @username = (SELECT create_random_hash(32));
  SET output = "-1";
  SET done_bool = FALSE;
  
  WHILE done_bool = FALSE DO
    SET done_bool = TRUE;
    SET @hash = (SELECT create_random_hash(128));

    IF (SELECT count((SELECT WWUSERID FROM users WHERE WWUSERID = @hash))) = 0 THEN 
      BEGIN
      -- Try to create it
	INSERT INTO users SET WWUSERID = @hash, nickname = @username, join_date = NOW();
      END;
    ELSE
      BEGIN
      -- Back around the loop
      SET done_bool = FALSE;
      END;
    END IF;
      
  END WHILE;
  
  SELECT @hash;
  END$$
  
DELIMITER ;
