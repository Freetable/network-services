-- MUST WRITE LOCK USERS BEFORE ISSUING THIS COMMAND!

DELIMITER $$

DROP PROCEDURE IF EXISTS create_wwfileid$$
CREATE PROCEDURE create_wwfileid ()

  BEGIN
	SET @uuid = (SELECT UUID());
  SET @sid = (SELECT UUID());

	INSERT INTO files SET WWFILEID = @uuid, random_hash = @sid;
	
	SELECT @uuid AS 'WWFILEID', @sid AS 'sid';

  END$$
  
DELIMITER ;
