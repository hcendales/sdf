---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 11/10/2011, 10:52:07 --
---------------------------------------------

spool 15_vw_ide.log

prompt
prompt Creating view VW_IDENTDEV
prompt =========================
prompt
create or replace view simit.vw_identdev as
select 0 as identificacion, ' TODOS ' as nombre from dual
  union
  select identificacion, ( identificacion  || '-' || nombre ) as nombre
    from novdevolucion
    order by 1
/


spool off
