---------------------------------------------
-- Export file for user SIMIT              --
-- Created by SEVEN on 16/03/2012, 7:59:01 --
---------------------------------------------

spool 01_vistas.log

prompt
prompt Creating view VW_CONCESIONARIOTRF
prompt =================================
prompt
create or replace view simit.vw_concesionariotrf as
select '99' as idcon, '  TODOS' as nombre from dual
  union
select '00' as idCon, ' SIN CONCESIONARIO' as nombre from dual
UNION
  select c.idconcesionario as idCon, c.idconcesionario || '-' || c.nombre as nombre
  from concesionario c
  where c.idconcesionario <> '00'
  order by 2  ASC
;

prompt
prompt Creating view VW_CUENTATRF
prompt ==========================
prompt
create or replace view simit.vw_cuentatrf as
select '999999999' as cta, 'TODOS' as nombre from dual
  union
  select c.cuenta as cta, ( b.nombre || '-' || c.indtipo || '-' || c.cuenta ) as nombre
  from cta_recaudo_fcm c, banco b
  where c.idbanco = b.idbanco
  order by 2  desc
;

prompt
prompt Creating view VW_MUNICIPIOTRF
prompt =============================
prompt
create or replace view simit.vw_municipiotrf as
select 'TODOS' as idMunicipio, '   TODOS' as nombre from dual
  union
  select 'SIN MUNICIPIO' as idMunicipio, '  SIN MUNICIPIO' as nombre from dual
  union
  select '00000001' as idMunicipio, ' IGNORAR DEPOSITO' as nombre from dual
  union
  select m.idmunicipio, ( m.nombre || '-' || d.nombre || '-' || m.idmunicipio ) as nombre from municipio m,  departamento d
  where m.iddepartamento = d.iddepartamento
  and m.idmunicipio <> '00000000'
  order by  2
;


spool off
