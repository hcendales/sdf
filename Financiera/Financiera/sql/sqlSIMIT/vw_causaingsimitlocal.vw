create or replace view vw_causaingsimitlocal as
select
operacion,
fec_corte_ini,
fec_corte_fin,
ori_idbanco,
bori.nombre "banco",
ori_cuenta,
valor_debito,
valor_credito,
deb_cta_con,
deb_cen_cos,
deb_nit_ter,
cre_cta_con,
cre_cen_cos,
cre_nit_ter,
orden,
concepto_con,
usuario_proceso,
fecha_proceso
   from RECAUDO_LOCAL_causacion r, banco bori
   where OPERACION = 'INGRESO'
   and indtipo = 'SIMIT'
   and r.ori_idbanco = bori.idbanco
   order by r.ori_idbanco, orden;

