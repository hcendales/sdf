---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 29/02/2012, 16:14:05 --
---------------------------------------------

spool 04_createViews.log

prompt
prompt Creating view VW_COBROSDEV
prompt ==========================
prompt
create or replace view simit.vw_cobrosdev as
select n."TIPOIDENTIFICACION",n."IDENTIFICACION",n."NOMBRE",n."IDBANCO",n."TIPOCUENTA",n."CUENTA",n."IDCONCESIONARIO",n."INDTIPO",n."IDMUNICIPIO",n."MOTIVO",n."VDEVOLUCION",n."VCONCESIONARIO",n."VFCM",n."VFONDOCOBERTURAFCM",n."VFONDOCOBERTURALIQ",n."VEQUILIBRIOECONOMICO",n."VSEVIAL",n."VFCMPOLCA",n."VMUNICIPIO",n."VFCMCONTRAVENCIONAL",n."VCONCONTRAVENCIONAL",n."TIPONOV",n."NUMERONOV",n."FECHANOV",n."USUARIONOV",n."USUARIOVAL",n."FECHAVAL",n."FECHAACT",n."ESTADONOV",n."FIRMA1",n."FIRMA2",n."USUARIOANUL",n."FECHAANUL",n."FECHAAPLICACION",n."VPOLCA",n."CUENTAREC",n."DNSGRANBANCO",n."DNSAVVILLAS",n."INDCOBRO",n."FECHACOBRO",n."REFERENCIATRF",n."OBSERVACIONES",n."VADICIONAL", m.nombre as nomMunicipio, decode(n.indcobro,0,'PENDIENTE DE COBRO','COBRO EJECUTADO') AS nomIndCobro from novDevolucion n, municipio m
where n.idmunicipio = m.idmunicipio
and n.indcobro in (0,1)
/

prompt
prompt Creating view VW_CONCEPTOPAGOLOC
prompt ================================
prompt
create or replace view vw_conceptopagoloc as
select 'TODOS' concepto from dual
union
select distinct concepto
from simit.recaudo_local_disp_tot
order by Concepto desc
/

prompt
prompt Creating view VW_CUENTAORIGENDEV
prompt ================================
prompt
create or replace view vw_cuentaorigendev as
select
r.ori_cuenta as cuenta,
r.ori_cuenta || '-' || r.indtipo || '-EXTERNO-' || b.nombre as nomCuenta
from recaudo_externo_disp_tot r, banco b
where r.ori_idbanco = b.idbanco
group by r.ori_idbanco, r.ori_cuenta, r.indtipo, b.nombre
union
select c.cuenta as cuenta,
c.cuenta || '-' || c.indtipo || '-EXTERNO-' || b.nombre as nomCuenta
from cta_recaudo_concesionario c,  banco b
where c.idbanco = b.idbanco
order by 1
/

prompt
prompt Creating view VW_CUENTAORIGENLOC
prompt ================================
prompt
create or replace view vw_cuentaorigenloc as
select '999999999' as ori_cuenta, 'TODOS' as nombre from dual
union
select ori_cuenta, ( b.nombre || '-' ||  r.indtipo || '-' || r.ori_cuenta) as nombre
from recaudo_local_disp r, banco b
where r.ori_idbanco = b.idbanco
order by 2  desc
/

prompt
prompt Creating view VW_IDENTDEV
prompt =========================
prompt
create or replace view vw_identdev as
select 0 as identificacion, ' TODOS ' as nombre from dual
  union
  select identificacion, ( identificacion  || '-' || nombre ) as nombre
    from novdevolucion
    order by 1
/

prompt
prompt Creating view VW_TRANSFERLOCAL
prompt ==============================
prompt
create or replace view vw_transferlocal as
select t.fec_corte_ini,
t.fec_corte_fin,
t.fec_dispersion,
t.concepto,
t.ori_idbanco,
t.ori_tipocuenta,
t.ori_cuenta,
t.ori_nit,
t.des_idbanco,
t.des_tipocuenta,
desencriptar(t.des_cuenta) des_cuenta,
t.des_nit,
t.valor,
t.enviadobanco,
t.referenciatrf,
t.estadotrf,
t.fechaenvio,
t.fechaconfirmada,
t.fechadevolucion,
t.motivodevolucion,
t.codigodevolucion,
t.fechaenvioach,
bo.nombre nombreBancoO,
bd.nombre nombreBancoD,
c.indtipo
from recaudo_local_disp_tot t, banco bo, banco bd, cta_recaudo_fcm c
where t.ori_idbanco = bo.idbanco
and t.des_idbanco = bd.idbanco
and t.ori_idbanco  = c.idbanco
and t.ori_cuenta = c.cuenta
/


spool off
