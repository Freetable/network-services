DELIMITER $$

DROP FUNCTION IF EXISTS validate_user$$

CREATE FUNCTION validate_user (nnickname VARCHAR(32), pass VARCHAR(128), ssessionid CHAR(128))

RETURNS VARCHAR(255)
DETERMINISTIC

BEGIN
  DECLARE p_hash VARCHAR(128);
  DECLARE t_hash VARCHAR(128);
    
  SET p_hash = (SELECT password FROM users WHERE nickname = nnickname);
  SET t_hash = SHA2(pass,512);
  
  IF STRCMP(p_hash,t_hash) = 0 THEN 
    UPDATE users SET sessionid = ssessionid WHERE nickname = nnickname;
    RETURN (SELECT WWUSERID FROM users WHERE nickname = nnickname);
  ELSE
   RETURN '-1';
  END IF;
  
END$$

DELIMITER ;
