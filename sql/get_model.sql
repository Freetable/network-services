DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_model$$
CREATE PROCEDURE get_model (uid CHAR(128))
  BEGIN
    SELECT model_blob, model_type FROM users WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
