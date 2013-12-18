DELIMITER $$

DROP PROCEDURE IF EXISTS validate_user$$

CREATE PROCEDURE validate_user (nnickname VARCHAR(32), pass VARCHAR(128))

BEGIN
  DECLARE p_hash VARCHAR(128);
  DECLARE t_hash VARCHAR(128);

  SET p_hash = (SELECT password FROM users WHERE nickname = nnickname);
  
  IF STRCMP(p_hash,pass) = 0 THEN 
    UPDATE users SET sessionid = create_random_hash(128) WHERE nickname = nnickname;
    SELECT WWUSERID, sessionid FROM users WHERE nickname = nnickname;
  ELSE
    SELECT '-1';
  END IF;
  
END$$

DELIMITER ;
