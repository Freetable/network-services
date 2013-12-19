-- MUST WRITE LOCK USERS BEFORE ISSUING THIS COMMAND!

DELIMITER $$

DROP PROCEDURE IF EXISTS create_wwuserid$$
CREATE PROCEDURE create_wwuserid ()

  BEGIN

	SET @uuid = (SELECT UUID());
  SET @sid = (SELECT UUID());

	INSERT INTO users SET WWUSERID = @uuid, sessionid = @sid, join_date = NOW();
	
	SELECT @uuid, @sid;
 
  END$$
  
DELIMITER ;
