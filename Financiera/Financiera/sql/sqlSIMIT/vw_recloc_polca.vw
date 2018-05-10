create or replace view vw_recloc_polca as
select
       recaudo_local_liquidacion.indorigen "Origen",
       recaudo_local_liquidacion.indTipo "Tipo",
       banco.nombre "Banco",
       concesionario.nombre "Operador",
       recaudo_local_liquidacion.idMunicipio "DIVIPO",
       municipio.nombre "Municipio",
       departamento.nombre "Departamento",
       recaudo_local_liquidacion.cta_recaudo "Cuenta Recaudo",
       recaudo_local_liquidacion.fec_corte "Fecha Corte",
       recaudo_local_liquidacion.fec_tran "Fecha Transaccion",
       recaudo_local_liquidacion.oficina_origen "Oficina",
       recaudo_local_liquidacion.valor_total "Vr Recaudo",
       recaudo_local_liquidacion.fec_dispersion "Fecha Dispersion",
       recaudo_local_liquidacion.s_valor_0 "Comision Recaudo",
       recaudo_local_liquidacion.p_valor_7 "Simit PM",
       recaudo_local_liquidacion.p_valor_8 "Concesionario",
       recaudo_local_liquidacion.p_valor_9 "Fondo Concesionario",
       recaudo_local_liquidacion.p_valor_10 "Fondo Simit",
       recaudo_local_liquidacion.p_valor_11 "Equilibrio economico PM",
       recaudo_local_liquidacion.p_valor_12 "Simt PP",
       recaudo_local_liquidacion.p_valor_13 "Sevial PP",
       recaudo_local_liquidacion.p_valor_14 "Equilibrio economico PP",
       recaudo_local_liquidacion.p_valor_15 "Polca",
       recaudo_local_liquidacion.p_valor_16 "Fcm CP",
       recaudo_local_liquidacion.p_valor_17 "Sevial CP",
       recaudo_local_liquidacion.p_valor_18 "Equilibrio economico CP",
       ( recaudo_local_liquidacion.p_valor_13 + recaudo_local_liquidacion.p_valor_17 ) "Sevial",
       recaudo_local_liquidacion.p_valor_19 "IvaFCM",
       recaudo_local_liquidacion.p_valor_20 "IvaSevial",
       recaudo_local_liquidacion.p_valor_21 "Retencion Sevial",
       recaudo_local_liquidacion.p_valor_22 "Timbre sevial",
       recaudo_local_liquidacion.p_valor_23 "Timbre fcm",
       recaudo_local_liquidacion.p_valor_24 "Neto Sevial",
       recaudo_local_liquidacion.p_valor_25 "Neto Concesionario",
       recaudo_local_liquidacion.p_valor_26 "Neto FCM",
       recaudo_local_liquidacion.p_valor_27 "Neto Simit",
       recaudo_local_liquidacion.p_valor_28 "Neto Equilibrio economico",
      recaudo_local_liquidacion.ind_proceso
   from recaudo_local_liquidacion,
       banco,
       municipio,
       departamento,
       concesionario
 where banco.idbanco = recaudo_local_liquidacion.idbanco
       and municipio.idmunicipio = recaudo_local_liquidacion.idmunicipio
       and departamento.iddepartamento = recaudo_local_liquidacion.iddepartamento
       and concesionario.idconcesionario = recaudo_local_liquidacion.idconcesionario
       and recaudo_local_liquidacion.indtipo = 'POLCA'
       and recaudo_local_liquidacion.idbanco = '02'
--       and TO_CHAR(recaudo_local_liquidacion.fec_corte,'YYYY/MM/DD') >= $P{P_FEC_INI}
--       and TO_CHAR(recaudo_local_liquidacion.fec_corte,'YYYY/MM/DD') <= $P{P_FEC_FIN}
 order by  recaudo_local_liquidacion.ind_proceso, recaudo_local_liquidacion.idbanco, recaudo_local_liquidacion.idconcesionario, recaudo_local_liquidacion.fec_corte,  recaudo_local_liquidacion.idmunicipio;

