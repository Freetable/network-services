DELIMITER $$

DROP PROCEDURE IF EXISTS validate_user$$

CREATE PROCEDURE validate_user (nnickname VARCHAR(32), pass VARCHAR(128))

BEGIN
  DECLARE p_hash VARCHAR(128);
  DECLARE t_hash VARCHAR(128);
  DECLARE sid CHAR(128);

	SET sid = (SELECT create_random_hash(128));  
  SET p_hash = (SELECT password FROM users WHERE nickname = nnickname);
  
	SET t_hash = SHA2(pass,512);

  -- When ready for the switch to SHA512 client side
	-- SET t_hash = pass;  

  IF STRCMP(p_hash,t_hash) = 0 THEN 
    UPDATE users SET sessionid = sid WHERE nickname = nnickname;
    SELECT WWUSERID,sessionid FROM users WHERE nickname = nnickname;
  ELSE
    SELECT '-1';
  END IF;
  
END$$

DELIMITER ;
