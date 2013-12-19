DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_nickname$$
CREATE PROCEDURE set_user_nickname (uid CHAR(128), nnickname VARCHAR(32), sid CHAR(128))
  BEGIN
    IF ((SELECT COUNT(nickname) FROM users where nickname = nnickname) = 0) THEN
      BEGIN
      UPDATE users SET nickname = nnickname WHERE WWUSERID = uid AND sessionid = sid;
      SELECT "1";
      END;
    ELSE
      SELECT "-1";
    END IF;
  END$$
  
DELIMITER ;
