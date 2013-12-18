DELIMITER $$

DROP PROCEDURE IF EXISTS get_email_from_nick$$
CREATE PROCEDURE get_email_from_nick (eemail CHAR(96))
  BEGIN
    SELECT first_name, nickname FROM users WHERE email = eemail;
  END$$
  
DELIMITER ;
