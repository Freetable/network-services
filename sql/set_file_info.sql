DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_file_info$$
CREATE PROCEDURE set_file_info (fid CHAR(128), ttitle VARCHAR(256), aartist VARCHAR(256), aalbum VARCHAR(256), yyear DATE, uurl VARCHAR(384), mmd5 CHAR(32), ssha1 CHAR(160), ssha512 CHAR(128))
  BEGIN
    UPDATE files SET title = ttitle, artist = aartist, album = aalbum, year = yyear, url = uurl, md5 = mmd5, sha1 = ssha1, sha512 = ssha512 WHERE WWFILEID = fid;
  END$$
 
DELIMITER ;
