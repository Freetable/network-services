DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_nickname$$
CREATE PROCEDURE set_user_nickname (uid CHAR(36), nnickname VARCHAR(32), sid CHAR(36))
  BEGIN
    IF ((SELECT COUNT(nickname) FROM users where nickname = nnickname) = 0) THEN
      BEGIN
      UPDATE users SET nickname = nnickname WHERE WWUSERID = uid AND sessionid = sid;
      SELECT 1 as result;
      END;
    ELSE
      SELECT 0 as result;
    END IF;
  END$$
  
DELIMITER ;
