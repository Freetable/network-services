DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_model$$
CREATE PROCEDURE set_model (uid CHAR(36), bdata BLOB, type INT UNSIGNED, sid CHAR(36))
  BEGIN
    UPDATE users SET model_blob = bdata, model_type = type WHERE WWUSERID = uid AND sessionid = sid;
  END$$
 
DELIMITER ;
