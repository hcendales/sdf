---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 01/03/2012, 14:54:13 --
---------------------------------------------

spool 14_vistadisp.log

prompt
prompt Creating view VW_RECAUDO_EXTERNO_DISP_TOT
prompt =========================================
prompt
create or replace view vw_recaudo_externo_disp_tot as
select "FEC_CORTE_INI","FEC_CORTE_FIN","FEC_DISPERSION","ID_CONCESIONARIO_LIQ","ORDEN","CONCEPTO","ORI_IDBANCO","ORI_TIPOCUENTA","ORI_CUENTA","ORI_NIT","DES_IDBANCO","DES_TIPOCUENTA","DES_CUENTA","DES_NIT","INDTIPO","USUARIO_PROCESO","FECHA_PROCESO","VALOR","DEB_CTA_CON","DEB_CEN_COS","DEB_NIT_TER","CRE_CTA_CON","CRE_CEN_COS","CRE_NIT_TER","CONCEPTO_CON","ID_CONCESIONARIO_PRO","IDMUNICIPIO","REFERENCIATRF","ENVIADOBANCO", "REFERENCIATRFORI"
    from recaudo_externo_disp_tot
/


spool off
