DELIMITER $$

DROP PROCEDURE IF EXISTS get_email_from_nick$$
CREATE PROCEDURE get_email_from_nick (nnickname CHAR(32))
  BEGIN
    SELECT first_name, email FROM users WHERE nickname = nnickname;
  END$$
  
DELIMITER ;
