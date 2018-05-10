CREATE OR REPLACE PROCEDURE "LOAD_FILE" (
 pfname VARCHAR2) IS

/*
define the directory inside Oracle when logged on as SYS
create or replace directory ctemp as 'c:\temp\';

grant read on the directory to the Staging schema
grant read on directory ctemp to staging;
*/

/* src_file BFILE;
 dst_file BLOB; */
 src_file BFILE;
 dst_file CLOB;
 lgh_file BINARY_INTEGER;
BEGIN
  src_file := bfilename('ORAREPORTS', pfname);

  -- insert a NULL record to lock
  INSERT INTO tmp_finan
  (id, nombre, archivo)
  VALUES
  (SEQ_TEMP_FINAN.Nextval, pfname, EMPTY_CLOB())
  RETURNING archivo INTO dst_file;

  -- lock record
  SELECT tmp_finan.archivo
  INTO dst_file
  FROM tmp_finan
  WHERE tmp_finan.nombre = pfname
  FOR UPDATE;

  -- open the file
  dbms_lob.fileopen(src_file, dbms_lob.file_readonly);

  -- determine length
  lgh_file := dbms_lob.getlength(src_file);

  -- read the file
  dbms_lob.loadfromfile(dst_file, src_file, lgh_file);

  -- update the blob field
  UPDATE tmp_finan
  SET tmp_finan.archivo = dst_file
  WHERE nombre = pfname;

  -- close file
  dbms_lob.fileclose(src_file);
  commit;
  dbms_output.put_line(pfname);
END load_file;
/

