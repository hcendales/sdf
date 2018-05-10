create or replace view vw_recloc_simit_tot as
select
       r.idbanco,
       max(b.nombre) banco,
       r.idconcesionario,
       max(c.nombre) concesionario,
       sum(r.valor_total) recuado,
       sum(r.s_valor_0) comision,
       sum(r.s_valor_1) simit25,
       sum(r.s_valor_2) concesionario65,
       sum(r.s_valor_3) fondo_con5,
       sum(r.s_valor_4) fondo_simit5,
       sum(r.s_valor_5) equilibrio,
       sum(r.s_valor_6) neto_concesionario
  from recaudo_local_liquidacion r,
       banco b,
       concesionario c
 where b.idbanco = r.idbanco
       and c.idconcesionario = r.idconcesionario
       and r.indtipo = 'SIMIT'
       and r.ind_proceso = 1
--       and to_char(r.fec_corte, 'yyyy/mm/dd') >= $P{P_FEC_INI}
--       and to_char(r.fec_corte, 'yyyy/mm/dd') <= $P{P_FEC_FIN}
 group by r.idbanco, r.idconcesionario
 order by r.idbanco, r.idconcesionario;

