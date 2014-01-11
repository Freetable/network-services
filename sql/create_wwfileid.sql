DELIMITER $$

DROP PROCEDURE IF EXISTS create_wwfileid$$
CREATE PROCEDURE create_wwfileid ()

  BEGIN
	SET @uuid = (SELECT UUID());
  SET @sid = (SELECT UUID());

	INSERT INTO files SET WWFILEID = @uuid, random_hash = @sid;
	
	SELECT @uuid AS 'result', @sid AS 'sid';

  END$$
  
DELIMITER ;
