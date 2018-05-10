---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 02/03/2012, 16:00:38 --
---------------------------------------------

spool 16_vw.log

prompt
prompt Creating view VW_MUNICIPIOTRF
prompt =============================
prompt
create or replace view vw_municipiotrf as
select 'TODOS' as idMunicipio, '  TODOS' as nombre from dual
  union
  select 'SIN MUNICIPIO' as idMunicipio, ' SIN MUNICIPIO' as nombre from dual
/*  union
  select t.idmunicipio, ( m.nombre || '-' || d.nombre || '-' || t.idmunicipio ) as nombre
  from trxsinidentificar t, municipio m, departamento d
  where t.idmunicipio = m.idmunicipio
  and m.iddepartamento = d.iddepartamento
  group by t.idmunicipio, m.nombre, d.nombre */
  union
  select m.idmunicipio, ( m.nombre || '-' || d.nombre || '-' || m.idmunicipio ) as nombre from municipio m,  departamento d
  where m.iddepartamento = d.iddepartamento

order by  2
/


spool off
