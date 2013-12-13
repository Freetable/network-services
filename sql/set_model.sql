DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_model$$
CREATE PROCEDURE set_model (uid CHAR(128), bdata BLOB, type INT UNSIGNED)
  BEGIN
    UPDATE users SET model_blob = bdata, model_type = type WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
