DELIMITER $$

DROP PROCEDURE IF EXISTS add_file_to_network$$
CREATE PROCEDURE add_file_to_network (fid CHAR(36), rh CHAR(128), ttitle VARCHAR(128), aartist VARCHAR(128), aalbum VARCHAR(128), yyear DATE, mmd5 CHAR(32), ssha1 CHAR(160), ssha512 CHAR(128))
BEGIN

	UPDATE files SET title = ttitle, artist = aartist, album = aalbum, year = yyear, md5 = mmd5, sha1 = ssha1, sha512 = ssha512 WHERE WWFILEID = fid AND random_hash = rh;
  
END$$
 
DELIMITER ;
