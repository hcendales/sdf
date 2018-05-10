---------------------------------------------
-- Export file for user SIMITCURSO         --
-- Created by SEVEN on 09/08/2012, 9:55:00 --
---------------------------------------------

set define off
spool 01_ajustes20120809.log

prompt
prompt Creating function SPLITTER_COUNT
prompt ================================
prompt
create or replace function simitcurso.splitter_count(str in varchar2, delim in char) return int as
val int;
begin
  val := length(replace(str, delim, delim || ' '));
  return val - length(str);
end;
/


spool off
