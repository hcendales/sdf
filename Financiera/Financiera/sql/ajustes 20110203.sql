-- Add/modify columns 
alter table RECAUDO_EXTERNO_LIQUIDACION add idbancoMun char(2);
alter table RECAUDO_EXTERNO_LIQUIDACION add tipoCuentaMun char(3);
alter table RECAUDO_EXTERNO_LIQUIDACION add ctaMun varchar2(250);
-- Add comments to the columns 
comment on column RECAUDO_EXTERNO_LIQUIDACION.idbancoMun
  is 'Banco de consignacion del municipio';
comment on column RECAUDO_EXTERNO_LIQUIDACION.tipoCuentaMun
  is 'Tipo cuenta consignacion municipio';
comment on column RECAUDO_EXTERNO_LIQUIDACION.ctaMun
  is 'Cuenta de consignacion municipio';

  
create or replace view vw_distotdetallado as
select l."ID_RECAUDO_EXTERNO_LIQUIDACION",l."ID_RECAUDO_EXTERNO",l."ID_CONCESIONARIO_PRO",l."ID_CONCESIONARIO_LIQ",l."INDTIPO",l."USUARIO_PROCESO",l."FECHA_PROCESO",l."IDMUNICIPIO",l."FEC_CORTE",l."IND_PROCESO",l."NUM_LIQUIDACION",l."DIAS_DISPERSION",l."FREC_DISPERSION",l."FEC_DISPERSION",l."IDBANCO",l."SMDLV",l."INDRETROACTIVIDAD",l."VALOR_TOTAL",l."VALOR_ADICIONAL",l."VALIDADOR_FECHA",l."INDFECHA2002",l."S_VALOR_0",l."S_VALOR_1",l."S_VALOR_2",l."S_VALOR_3",l."S_VALOR_4",l."S_VALOR_5",l."S_VALOR_6",l."S_VALOR_7",l."S_VALOR_8",l."S_VALOR_9",l."S_VALOR_10",l."S_VALOR_11",l."S_VALOR_12",l."S_VALOR_13",l."S_VALOR_14",l."S_VALOR_15",l."S_VALOR_16",l."S_VALOR_17",l."S_VALOR_18",l."S_VALOR_19",l."S_VALOR_20",l."S_VALOR_21",l."S_VALOR_22",l."S_VALOR_23",l."S_VALOR_24",l."S_VALOR_25",l."S_VALOR_26",l."S_VALOR_27",l."S_VALOR_28",l."CTA_RECAUDO",l."IND_BASE_TER1",l."IND_BASE_TER2",l."IND_BASE_TER3",l."IND_BASE_TER4",l."POR_BASE_TER1",l."POR_BASE_TER2",l."POR_BASE_TER3",
l."POR_BASE_TER4",l."S_VALOR_29",l."NOM_TER1",l."NOM_TER2",l."NOM_TER3",l."NOM_TER4",l."P_VALOR_1",l."P_VALOR_2",l."P_VALOR_3",l."P_VALOR_4",l."P_VALOR_5",l."P_VALOR_6",l."P_VALOR_7",l."P_VALOR_8",l."P_VALOR_9",l."P_VALOR_10",l."P_VALOR_11",l."P_VALOR_12",l."P_VALOR_13",l."P_VALOR_14",l."P_VALOR_15",l."P_VALOR_16",l."P_VALOR_17",l."P_VALOR_18",l."P_VALOR_19",l."P_VALOR_20",l."P_VALOR_21",l."P_VALOR_22",l."P_VALOR_23",l."P_VALOR_24",l."P_VALOR_25",l."P_VALOR_26",l."P_VALOR_27",l."P_VALOR_28",l."P_VALOR_29",l."P_VALOR_30",l."P_VALOR_31",l."P_VALOR_32",l."P_VALOR_33",l."P_VALOR_34",l."P_VALOR_35",l."P_VALOR_36",l."P_VALOR_37",l."P_VALOR_38",l."P_VALOR_39",l."P_VALOR_40",l."P_VALOR_41",l."P_VALOR_42",l."P_VALOR_43",l."S_VALOR_30",l."P_VALOR_44",l."FEC_DISPERSION_CON",l."NIT_MUNICIPIO",l."NIT_TERCERO1",l."NIT_TERCERO2",l."NIT_TERCERO3",l."NIT_TERCERO4",l."NIT_CONCESIONARIO",l."NIT_FONDO",l."NIT_CONCESIONARIOZON",
b.nombre as nomBanco,
c.nombre as nomConcesionario,
m.nombre as nomMunicipio,
(s_valor_26 + p_valor_39) as v_municipio,
(s_valor_19 + p_valor_32) as VTercero1,
(s_valor_21 + p_valor_34) as VTercero2,
r.identificacion,
r.num_comparendo,
l.idbancomun bancoMun,
bm.nombre nomBancoMun,
desencriptar(l.ctamun) as ctaMunicipio
from
recaudo_externo_liquidacion l, banco b, concesionario c, municipio m, recaudo_externo r ,
banco bm
where l.idbanco = b.idbanco and l.ID_CONCESIONARIO_LIQ = c.idconcesionario and l.idmunicipio = m.idmunicipio and l.id_recaudo_externo = r.id_recaudo_externo
and l.idbancomun = bm.idbanco


create or replace view vw_conceptopago as
select distinct concepto
from recaudo_externo_disp_tot
order by Concepto



create or replace view vw_cuentaorigen as
select distinct ori_cuenta
from recaudo_externo_disp_tot
order by ori_cuenta

update recaudo_externo_liquidacion
set idbancomun = '00',
tipocuentamun = 'AHO',
ctamun = encriptar('SIN DATO');

pk_param

pk_proc
  