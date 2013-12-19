-- MUST WRITE LOCK USERS BEFORE ISSUING THIS COMMAND!

DELIMITER $$

DROP PROCEDURE IF EXISTS create_wwfileid$$
CREATE PROCEDURE create_wwfileid ()

  BEGIN
	SET @uuid = (SELECT UUID());
  SET @sid = (SELECT UUID());

	INSERT INTO users SET WWFILEID = @uuid, random_hash = @sid;
	
	SELECT @uuid, @sid;

  END$$
  
DELIMITER ;
