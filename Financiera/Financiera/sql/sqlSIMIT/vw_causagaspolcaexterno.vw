create or replace view vw_causagaspolcaexterno as
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
   from RECAUDO_externo_causacion r, banco bori
   where OPERACION = 'GASTO'
   and indtipo = 'POLCA'
   and r.ori_idbanco = bori.idbanco
   and ( r.valor_debito <> 0 or r.valor_credito <> 0 )
   order by r.ori_idbanco, r.orden, r.idconcesionario;

