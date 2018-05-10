create or replace view vw_recloc_polca_tot as
select
t.IDBANCO,
max(b.nombre) Banco,
t.IDCONCESIONARIO,
max(c.nombre) Concesionario,
SUM(t.VALOR_TOTAL) VALOR_RECAUDO,
SUM(t.P_VALOR_15) POLCA,
SUM(t.P_VALOR_17) SEVIAL_2_7,
SUM(t.P_VALOR_16) FCM_1_8,
SUM(t.P_VALOR_27) FCM_3_25,
SUM(t.P_VALOR_13) SEVIAL_3_0,
SUM(t.P_VALOR_25) OPERADOR_3_25,
SUM(t.P_VALOR_9 + t.P_VALOR_10 ) FONDO_0_5,
SUM(t.P_VALOR_20) IVA_2_7,
SUM(t.P_VALOR_19) IVA_1_8
from recaudo_local_liquidacion t, banco b, concesionario c
where t.indtipo = 'POLCA'
and t.ind_proceso = 1
and t.idbanco = b.idbanco
and t.idconcesionario = c.idconcesionario
--and to_char(t.fec_corte, 'yyyy/mm/dd') >= $P{P_FEC_INI}
--and to_char(t.fec_corte, 'yyyy/mm/dd') <= $P{P_FEC_FIN}
GROUP BY t.IDBANCO, t.IDCONCESIONARIO
ORDER BY t.IDBANCO, t.IDCONCESIONARIO;

