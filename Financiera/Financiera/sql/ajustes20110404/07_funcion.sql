---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 07/04/2011, 10:15:59 --
---------------------------------------------

spool 06_funcion.log

prompt
prompt Creating function TOKENIZE
prompt ==========================
prompt
create or replace function tokenize (str varchar2, delim char) return token_list as
ret token_list;
target int;
i int;
this_delim int;
last_delim int;
cadena varchar2(100);
cadenaOri varchar2(100);
strFin varchar(1000);

BEGIN

  target := splitter_count(str, '"');
  i := 1;
  strFin :=  str;
  
  if ( target > 1 ) then
  while i <= target
  loop
      this_delim := instr(str, '"', 1, i);
      last_delim := instr(str, '"', 1, i+1);
      cadena := substr(str,this_delim+1,last_delim - this_delim -1);
      cadenaOri := substr(str,this_delim,last_delim - this_delim + 1);

      if (delim <> ',' ) then
         cadena := replace(cadena,',','');
      end if;

      if (delim <> '$' ) then
         cadena := replace(cadena,'$','');
      end if;

      strFin := replace(str,cadenaOri, cadena);

      i := i + 2;

  end loop;

  end if;


  ret := token_list();

  i := 1;
  last_delim := 0;
  target := splitter_count(strFin, delim);
  while i <= target
  loop
    ret.extend();
    this_delim := instr(strFin, delim, 1, i);
    ret(i):= substr(strFin, last_delim + 1, this_delim - last_delim -1);
    i := i + 1;
    last_delim := this_delim;
  end loop;
  ret.extend();
  ret(i):= substr(strFin, last_delim + 1);
  return ret;
end;
/


spool off
