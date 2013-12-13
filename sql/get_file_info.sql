DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_file_info$$
CREATE PROCEDURE get_file_info (fid CHAR(128))
  BEGIN
    SELECT title, artist, album, year, url, md5, sha1, sha512 FROM files WHERE WWFILEID = fid;
  END$$
 
DELIMITER ;
