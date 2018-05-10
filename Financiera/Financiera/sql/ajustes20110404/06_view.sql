--------------------------------------------
-- Export file for user SIMIT             --
-- Created by user on 07/04/2011, 8:15:08 --
--------------------------------------------

spool 06_view.log

prompt
prompt Creating view VW_CUENTATRF
prompt ==========================
prompt
create or replace view vw_cuentatrf as
select '999999999' as cta, 'TODOS' as nombre from dual
  union
  select t.cuenta as cta , ( b.nombre || '-' ||  t.indtipo || '-' || t.cuenta) as nombre
  from trxsinidentificar t, banco b
  where t.idbanco = b.idbanco
  group by b.nombre, t.indTipo, t.cuenta
  order by 2  desc
/

prompt
prompt Creating view VW_MUNICIPIOTRF
prompt =============================
prompt
create or replace view vw_municipiotrf as
select 'TODOS' as idMunicipio, '  TODOS' as nombre from dual
  union
  select 'SIN MUNICIPIO' as idMunicipio, ' SIN MUNICIPIO' as nombre from dual
  union
  select t.idmunicipio, ( m.nombre || '-' || d.nombre || '-' || t.idmunicipio ) as nombre
  from trxsinidentificar t, municipio m, departamento d
  where t.idmunicipio = m.idmunicipio
  and m.iddepartamento = d.iddepartamento
  group by t.idmunicipio, m.nombre, d.nombre
order by  2
/

prompt
prompt Creating view VW_PERIODOTRF
prompt ===========================
prompt
create or replace view vw_periodotrf as
select '999999' as periodo, 'TODOS' as nombre from dual
  union
  select periodo, periodo as nombre
    from trxsinidentificar
    group by periodo
    order by 1 desc
/


spool off
