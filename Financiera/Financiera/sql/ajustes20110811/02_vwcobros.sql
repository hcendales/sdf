---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 11/08/2011, 11:10:40 --
---------------------------------------------

spool 02_vwcobros.log

prompt
prompt Creating view VW_COBROSDEV
prompt ==========================
prompt
create or replace view simit.vw_cobrosdev as
select n."TIPOIDENTIFICACION",n."IDENTIFICACION",n."NOMBRE",n."IDBANCO",n."TIPOCUENTA",n."CUENTA",n."IDCONCESIONARIO",n."INDTIPO",n."IDMUNICIPIO",n."MOTIVO",n."VDEVOLUCION",n."VCONCESIONARIO",n."VFCM",n."VFONDOCOBERTURAFCM",n."VFONDOCOBERTURALIQ",n."VEQUILIBRIOECONOMICO",n."VSEVIAL",n."VFCMPOLCA",n."VMUNICIPIO",n."VFCMCONTRAVENCIONAL",n."VCONCONTRAVENCIONAL",n."TIPONOV",n."NUMERONOV",n."FECHANOV",n."USUARIONOV",n."USUARIOVAL",n."FECHAVAL",n."FECHAACT",n."ESTADONOV",n."FIRMA1",n."FIRMA2",n."USUARIOANUL",n."FECHAANUL",n."FECHAAPLICACION",n."VPOLCA",n."CUENTAREC",n."DNSGRANBANCO",n."DNSAVVILLAS",n."INDCOBRO",n."FECHACOBRO",n."REFERENCIATRF",n."OBSERVACIONES",n."VADICIONAL", m.nombre as nomMunicipio, decode(n.indcobro,0,'PENDIENTE DE COBRO','COBRO EJECUTADO') AS nomIndCobro from novDevolucion n, municipio m
where n.idmunicipio = m.idmunicipio
and n.indcobro in (0,1)
/


spool off
