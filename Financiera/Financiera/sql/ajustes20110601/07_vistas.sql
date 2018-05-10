--------------------------------------------
-- Export file for user SIMIT             --
-- Created by user on 02/06/2011, 8:56:14 --
--------------------------------------------

spool 06_vw_concec.log

prompt
prompt Creating view VW_CONCESIONARIOTRF
prompt =================================
prompt

create or replace view vw_periodotrf as
select '999999' as periodo, 'TODOS' as nombre from dual
  union
  select periodo, periodo as nombre
    from trxsinidentificar
     group by periodo
    order by 1 desc;
/	

create or replace view vw_indtipo as
select 'POLCA' as indTipo, 'POLCA' as nombre
    from dual
union
  select 'SIMIT' as indTipo, 'SIMIT' as nombre
    from dual;
/	

create or replace view vw_pconsigando as
select 10 as porcentaje, '10' as nombre
    from dual
union
  select 45 as porcentaje, '45' as nombre
    from dual
union
  select 55 as porcentaje, '55' as nombre
    from dual;
/

create or replace view vw_concesionariotrf as
select '99' as idcon, '  TODOS' as nombre from dual
  union
select '00' as idCon, ' SIN CONCESIONARIO' as nombre from dual
UNION
  select t.concesionariozon as idCon , c.nombre as nombre
  from trxsinidentificar t, concesionario c
  where t.concesionariozon = c.idconcesionario
  group by t.concesionariozon , c.nombre
  order by 2  ASC;
/

spool off

