DELIMITER $$

DROP FUNCTION IF EXISTS create_random_hash$$
CREATE FUNCTION create_random_hash (bits INT UNSIGNED)

RETURNS TEXT
DETERMINISTIC

  BEGIN
  
  DECLARE output TEXT DEFAULT '';
  
  IF bits > 7 THEN BEGIN
     
	DECLARE counter INT UNSIGNED;
	DECLARE newcharacter CHAR(1);
    
	SET counter = 0;
    
	WHILE counter < bits DO

	  SET newcharacter = (SELECT ELT(1 + FLOOR(RAND() * 63), 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','u','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9' ));
	  SET output = CONCAT(output,newcharacter);
	  SET counter = counter + 1;
	  
	END WHILE;
      END;
  ELSE
      BEGIN
	SET output = '-1';
      END;
  END IF;
  
  RETURN(output);
  
  END$$
  
DELIMITER ;
