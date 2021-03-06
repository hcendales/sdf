---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 01/03/2012, 14:37:14 --
---------------------------------------------

spool 13_vista.log

prompt
prompt Creating view VW_DISTRFSIMITEXTERNO
prompt ===================================
prompt
create or replace view vw_distrfsimitexterno as
select
      fec_corte_ini,
      fec_corte_fin,
      fec_dispersion,
      r.id_concesionario_liq,
      orden,
      concepto,
      ori_idbanco,
      ori_tipocuenta,
      ori_cuenta,
      ori_nit,
      des_idbanco,
      des_tipocuenta,
      desencriptar(des_cuenta) as des_cuenta,
      des_nit,
      indtipo,
      usuario_proceso,
      fecha_proceso,
      valor,
      c.nombre as Concesionario,
      bdes.nombre as BancoDes,
      bori.nombre as BancoOri,
      r.idmunicipio,
      decode(r.referenciatrfori,null,r.referenciatrf,r.referenciatrfori) as referenciatrf
from vw_RECAUDO_externo_DISP_TOT r, concesionario c, banco bdes, banco bori
where r.id_concesionario_liq = c.idconcesionario
and r.ori_idbanco = bori.idbanco
and r.des_idbanco = bdes.idbanco
/


spool off
